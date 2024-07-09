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
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var dob = Date()
    @State private var gender = 0
    @State private var location = CLLocation()
    @ObservedObject var vm: AuthenticationVM
    @State private var avatarItem: PhotosPickerItem?
    @State private var avatarImage: Image?
    var body: some View {
        AuthenticationPage {
            RDTopNavigationView(
                params: RDTopNavigationParams(type: .primary, title: "Additional Information"))
        } footer: {
            RDButtonView(.large, .primary, "Create account") {
                print("Button Pressed")
            }
        } content: {
            PhotosPicker(selection: $avatarItem, matching: .images) {
                if let avatarImage {
                    avatarImage
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
            .onChange(of: avatarItem, perform: { value in
                Task {
                    if let loaded = try? await avatarItem?.loadTransferable(type: Image.self) {
                        avatarImage = loaded
                    } else {
                        print("Failed")
                    }
                }
            })
            .padding()

            RDTextField(
                params: RDTextFieldParams(
                    type: .primary,
                    placeholder: "First name"),
                text: $firstName)
            
            RDTextField(
                params: RDTextFieldParams(
                    type: .primary,
                    placeholder: "Last name"),
                text: $lastName)
            
            
            
            
        }

    }
}
