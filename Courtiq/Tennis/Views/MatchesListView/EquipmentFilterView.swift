//
//  EquipmentFilterView.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-12-16.
//

import AuthenticationService
import RDDesignSystem
import SwiftUI

// MARK: - AddStringView

struct EquipmentFilterView: View {

    // MARK: - Internal

    var body: some View {
        MarqueeView {
            RDNavigationBar(.primary, title: "Equipment Filters", leading: {}, trailing: {
                Image.Token.Icons.close
                    .rdActionIcon {
                        print("Add new string entry")
                    }
            })
        } content: {
            Text("EquipmentFilterView")
        } footer: {
            RDButtonView(.large, .primary, "Apply") {
                print("EquipmentFilterView")
            }
        }
        .navigationBarBackButtonHidden()
    }
    
    // MARK: - Private Properties
}
