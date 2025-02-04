//
//  AdditionalInfoView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-06-26.
//

import RDDesignSystem
import SwiftUI
import PhotosUI
import CoreLocation
import GraphQLModels
import Models
import LocationService

struct AdditionalInfoView: View {
    
    // MARK: - Lifecycle
    
    public init(vm: AuthenticationVM) {
        _vm = StateObject(wrappedValue: vm)
    }
    
    // MARK: - Internal
    
    var body: some View {
        MarqueeView {
            RDNavigationBar(.primary, title: "Additional Information")
        } content: {

            ScrollView(.vertical) {
                PhotosPicker(selection: $vm.selectedProfileImage, matching: .images) {
                    if let image = vm.selectedImage {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 120, height: 120)
                            .clipShape(Circle())
                            .overlay(
                                Circle()
                                    .stroke(Color.TokenColor.Semantic.Border.primary, lineWidth: 3)
                            )
                        
                    } else {
                        Circle()
                            .stroke(Color.TokenColor.Semantic.Border.primary, lineWidth: 3)
                            .frame(width: 120, height: 120)
                            .overlay {
                                Image.Token.Icons.upload
                                    .resizable()
                                    .frame(width: 48, height: 48)
                                    .foregroundColor(Color.TokenColor.Semantic.Icon.default)
                            }
                    }
                }
                .onChange(of: vm.selectedProfileImage, perform: { value in
                    Task {
                        if let loaded = try? await vm.selectedProfileImage?.loadTransferable(type: Image.self) {
                            vm.selectedImage = loaded
                        } else {
                            print("Failed")
                        }
                    }
                })
                .padding()

                RDTextField(textFieldType: .primary,
                            placeholder: "Username",
                            helperText: vm.isUsernameAvailableText,
                            leadingIcon: Image.Token.Icons.person,
                            value: $vm.completeRegistrationInput.username)
                .autocapitalization(.none)
                .onChange(of: vm.completeRegistrationInput.username, perform: { value in
                    vm.handle(action: .usernameValueChanged(value))
                })
                
                HStack {
                    RDTextField(textFieldType: .primary,
                                placeholder: "First name",
                                leadingIcon: Image.Token.Icons.person,
                                value: $vm.completeRegistrationInput.firstName)
                    RDTextField(textFieldType: .primary,
                                placeholder: "Last name",
                                leadingIcon: Image.Token.Icons.person,
                                value: $vm.completeRegistrationInput.lastName)
                }
                

                
                RDTextField(textFieldType: .primary,
                            placeholder: "Bio",
                            leadingIcon: Image.Token.Icons.person,
                            value: $vm.completeRegistrationInput.bio)
                
                HStack(alignment: .top) {
                    RDTextField(
                        textFieldType: .date,
                        placeholder: "Date of birth",
                        value: $dateString,
                        dateValue: $vm.completeRegistrationInput.dateOfBirth,
                        state: .constant(.normal)
                    )

                    RDTextField(
                        textFieldType: .dropdown,
                        placeholder: "Gender",
                        value: Binding(
                            get: {
                                if let gender = vm.completeRegistrationInput.gender {
                                    return gender.displayName
                                }
                                return ""
                            },
                            set: { newValue in
                                if let gender = Gender.allCases.first(where: { $0.displayName == newValue }) {
                                    vm.completeRegistrationInput.gender = gender
                                }
                            }
                        ),
                        dropdownItems: Gender.allCases.map { gender in
                            DropdownItem(image: Image.Token.Icons.person, title: gender.displayName)
                        }
                    )
                }
                
                RDTextField(textFieldType: .dropdown,
                            placeholder: "City",
                            helperText: "We use this to find tennis courts around you",
                            leadingIcon: Image.Token.Icons.map,
                            value: $vm.completeRegistrationInput.city,
                            dropdownItems: vm.citiesMenuList)
                .onChange(of: vm.completeRegistrationInput.city) { newValue in
                    vm.handle(action: .searchForCities(vm.completeRegistrationInput.city))
                }

                // TODO: Implement city
                
            }


        } footer: {
            RDButtonView(.large, .primary, "Create account", disable: !isFormValid) {
                vm.handle(action: .updateAddInfoBtn)
            }
        }
        .onAppear() {
            Task {
                await vm.printIDToken()
                do {
                    try await locationManager.requestWhenInUseAuthorization()
                    let (lat, lng) = try await locationManager.fetchCurrentCoordinate()
                    let location = try await locationManager.getLocationDetails(latitude: lat, longitude: lng)
                    vm.completeRegistrationInput.city = (location.city ?? "") + ", " + (location.country ?? "")
                } catch {
                    print(error.localizedDescription)
                }
            }        }
    }
    
    private var isFormValid: Bool {
        !vm.completeRegistrationInput.firstName.isEmpty
        && !vm.completeRegistrationInput.lastName.isEmpty
        && vm.completeRegistrationInput.gender != nil
        && !dateString.isEmpty
        && vm.isUsernameAvailable
        && !vm.completeRegistrationInput.city.isEmpty
    }
    
    // MARK: - Private
    @StateObject private var locationManager: CourtIQLocationManager = CourtIQLocationManager()
    @State private var dateString: String = ""
    @State private var genderString: String = ""
    @StateObject private var vm: AuthenticationVM
}
