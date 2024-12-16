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
                PhotosPicker(selection: $vm.selectedItem, matching: .images) {
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
                .onChange(of: vm.selectedItem, perform: { value in
                    Task {
                        if let loaded = try? await vm.selectedItem?.loadTransferable(type: Image.self) {
                            vm.selectedImage = loaded
                        } else {
                            print("Failed")
                        }
                    }
                })
                .padding()

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
                            placeholder: "Username",
                            helperText: vm.isUsernameAvailableText,
                            leadingIcon: Image.Token.Icons.person,
                            value: $vm.updateUser.firstName)
                .autocapitalization(.none)
                .onChange(of: vm.updateUser.username, perform: { value in
                    vm.handle(action: .usernameValueChanged(value))
                })
                
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
                                // Add debug print to see what's being returned
                                let value = vm.updateUser.gender?.displayName ?? ""
                                print("Getting gender display value: \(value)")
                                return value
                            },
                            set: { newValue in
                                // Add debug print to see what value we're receiving
                                print("Attempting to set gender with value: \(newValue)")
                                if let newGender = API.Gender.from(displayString: newValue) {
                                    print("Successfully parsed to gender: \(newGender)")
                                    vm.updateUser.gender = newGender
                                } else {
                                    print("Failed to parse gender from: \(newValue)")
                                }
                            }
                        ),
                        dropdownItems: [
                            DropdownItem(image: Image.Token.Icons.person, title: "Male"),
                            DropdownItem(image: Image.Token.Icons.person, title: "Female"),
                            DropdownItem(image: Image.Token.Icons.person, title: "Non Binary")
                        ]
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
    @ObservedObject private var vm: AuthenticationVM
}
