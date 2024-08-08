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
    @State private var dob = Date()
    @State private var gender = 0
    @State private var location = CLLocation()
    @ObservedObject var vm: AuthenticationVM
    @State private var firstNameState = RDTextField.RDTextFieldState.normal
    @State private var lastNameState = RDTextField.RDTextFieldState.normal

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
                        placeholder: "First name",
                        icon: (leadingIcon: Image.Token.Icons.person, trailingIcon: nil),
                        value: Binding(
                            get: { vm.user.firstName ?? "" },
                            set: { vm.user.firstName = $0.isEmpty ? nil : $0 }),
                        state: $firstNameState)
            
            RDTextField(textFieldType: .primary,
                        placeholder: "Last name",
                        icon: (leadingIcon: Image.Token.Icons.person, trailingIcon: nil),
                        value: Binding(
                            get: { vm.user.lastName ?? "" },
                            set: { vm.user.lastName = $0.isEmpty ? nil : $0 }),
                        state: $lastNameState)
        } footer: {
            RDButtonView(.large, .primary, "Create account") {
                vm.handle(action: .updateAddInfoBtn)
            }

        }
    }
}
