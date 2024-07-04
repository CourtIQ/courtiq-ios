//
//  AdditionalInfoView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-06-26.
//

import RDDesignSystem
import SwiftUI
import CoreLocation

struct AdditionalInfoView: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var dob = Date()
    @State private var gender = 0
    @State private var location = CLLocation()
    
    var body: some View {
        AuthenticationPage {
            RDTopNavigationView(
                params: RDTopNavigationParams(type: .primary, title: "Additional Informatino"))
        } footer: {
            RDButtonView(.large, .primary, "Create account") {
                print("Button Pressed")
            }
        } content: {
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

#Preview {
    AdditionalInfoView()
}
