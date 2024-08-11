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
            PhotosPicker(selection: $vm.selectedItem, matching: .images) {
                if let image = vm.selectedImage {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                        .overlay(
                            Circle()
                                .stroke(Color.black, lineWidth: 4)
                        )
                    
                } else {
                    Circle()
                        .stroke(Color.black, lineWidth: 4)
                        .frame(width: 120, height: 120)
                        .overlay {
                            Image("photo-camera")
                                .frame(width: 48, height: 48)
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
            
            RDTextField(textFieldType: .primary,
                        placeholder: "Username",
                        icon: (leadingIcon: Image.Token.Icons.person, trailingIcon: nil),
                        value: Binding(
                            get: { vm.user.username ?? "" },
                            set: { vm.user.username = $0.isEmpty ? nil : $0 }))
            .autocapitalization(.none)
            
            RDTextField(textFieldType: .primary,
                        placeholder: "Full name",
                        icon: (leadingIcon: Image.Token.Icons.person, trailingIcon: nil),
                        value: Binding(
                            get: { vm.user.displayName ?? "" },
                            set: { vm.user.displayName = $0.isEmpty ? nil : $0 }))
            
            HStack {
                RDTextField(
                    textFieldType: .date,
                    placeholder: "Date of birth",
                    value: $dateString,
                    dateValue: $vm.user.dob,
                    state: .constant(.normal)
                )
                RDTextField(textFieldType: .dropdown,
                            placeholder: "Gender",
                            value: Binding(
                                get: { vm.user.gender ?? "" },
                                set: { vm.user.gender = $0.isEmpty ? nil : $0 }),
                            dropdownItems: [DropdownItem(image: Image.Token.Icons.person, title: "Male"),
                                            DropdownItem(image: Image.Token.Icons.person, title: "Female"),
                                            DropdownItem(image: Image.Token.Icons.person, title: "Male"),
                                            DropdownItem(image: Image.Token.Icons.person, title: "Female")])
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
