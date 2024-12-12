//
//  RDIconView.swift
//
//
//  Created by Pranav Suri on 2024-12-11.
//

import SwiftUI

struct RDIconView: View {
    var icon: Image?
    var color: Color
    var action: (() -> Void)? = nil
    
    var body: some View {
        Group {
            if let icon = icon {
                if let action = action {
                    Button(action: action) {
                        icon
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20)
                            .foregroundColor(color)
                    }
                } else {
                    icon
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20)
                        .foregroundColor(color)
                }
            }
        }
    }
}
