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
//    @State private var dob = Date()
    @State private var gender = 0
    @State private var location = CLLocation()
    @ObservedObject var vm: AuthenticationVM
    @State private var dob: Int = 0

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
            
            RDTextField(textFieldType: .primary,
                        placeholder: "Full name",
                        icon: (leadingIcon: Image.Token.Icons.person, trailingIcon: nil),
                        value: Binding(
                            get: { vm.user.firstName ?? "" },
                            set: { vm.user.firstName = $0.isEmpty ? nil : $0 }))

            
            HStack {
                RDNumberInput(placeholder: "Date of Birth", value: $dob, range: 1...100,
                              layout: .horizontal, fixedWidth: false)
                RDTextField(textFieldType: .primary, placeholder: "Gender", value: Binding(
                    get: { vm.user.gender ?? "" },
                    set: { vm.user.gender = $0.isEmpty ? nil : $0 }))
            }
            
            HStack {
                
            }
        } footer: {
            RDButtonView(.large, .primary, "Create account") {
                vm.handle(action: .updateAddInfoBtn)
            }

        }
    }
}
