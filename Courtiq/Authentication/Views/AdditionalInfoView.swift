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
import Models

struct AdditionalInfoView: View {
    
    // MARK: - Lifecycle
    
    public init(vm: AuthenticationVM) {
        self.vm = vm
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
                            value: $vm.updateUser.username)
                .autocapitalization(.none)
                .onChange(of: vm.updateUser.username, perform: { value in
                    vm.handle(action: .usernameValueChanged(value))
                })
                
                HStack {
                    RDTextField(textFieldType: .primary,
                                placeholder: "First name",
                                leadingIcon: Image.Token.Icons.person,
                                value: $vm.updateUser.firstName)
                    RDTextField(textFieldType: .primary,
                                placeholder: "Last name",
                                leadingIcon: Image.Token.Icons.person,
                                value: $vm.updateUser.lastName)
                }
                

                
                RDTextField(textFieldType: .primary,
                            placeholder: "Bio",
                            leadingIcon: Image.Token.Icons.person,
                            value: $vm.updateUser.bio)
                
                HStack(alignment: .top) {
                    RDTextField(
                        textFieldType: .date,
                        placeholder: "Date of birth",
                        value: $dateString,
                        dateValue: $vm.updateUser.dateOfBirth,
                        state: .constant(.normal)
                    )

                    RDTextField(
                        textFieldType: .dropdown,
                        placeholder: "Gender",
                        value: Binding(
                            get: {
                                if let gender = vm.updateUser.gender {
                                    genderString = gender.displayName
                                    return genderString
                                } else {
                                    return genderString
                                }
                            },
                            set: { newValue in
                                if let newGender = API.Gender.from(displayString: newValue) {
                                    genderString = newValue
                                    vm.updateUser.gender = newGender
                                } else {
                                    genderString = newValue

                                    vm.updateUser.gender = nil
                                }
                            }
                        ),
                        dropdownItems: API.Gender.allCases.map { gender in
                            DropdownItem(image: Image.Token.Icons.person, title: gender.displayName)
                        }
                    )
                }
                
                // TODO: Implement city
                
            }
            .onAppear() {
                Task {
                    await vm.printIDToken()
                }
            }

        } footer: {
            RDButtonView(.large, .primary, "Create account") {
                vm.handle(action: .updateAddInfoBtn)
            }
            
        }
    }
    
    // MARK: - Private
    
    @State private var dateString: String = ""
    @State private var genderString: String = ""
    @ObservedObject private var vm: AuthenticationVM
}
