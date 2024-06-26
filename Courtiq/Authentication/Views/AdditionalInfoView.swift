//
//  AdditionalInfoView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-06-26.
//

import RDDesignSystem
import SwiftUI

struct AdditionalInfoView: View {
    var body: some View {
        AuthenticationPage {
            RDTopNavigationView(
                params: RDTopNavigationParams(type: .primary, title: "Additional Informatino"))
        } footer: {
            Text("Hello")
        } content: {
            Text("Hello")
        }

    }
}

#Preview {
    AdditionalInfoView()
}
