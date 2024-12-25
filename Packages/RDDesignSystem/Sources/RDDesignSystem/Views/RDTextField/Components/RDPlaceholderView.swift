//
//  RDPlaceholderView.swift
//
//
//  Created by Pranav Suri on 2024-12-11.
//

import SwiftUI

struct RDPlaceholderView: View {
    var placeholder: String
    var isActive: Bool
    var isDateType: Bool
    var state: RDTextField.RDTextFieldState
    
    var body: some View {
        Text(placeholder)
            .dynamicNunitoSans(size: isActive || isDateType ? 14 : 16,
                               weight: isActive || isDateType ? .bold : .regular)
            .foregroundColor(state.placeholderColor)
            .frame(height: 24)
            .padding(.leading, 4)
            .offset(y: isActive || isDateType ? -12 : 0)
            .offset(y: isDateType ? -4 : 0)
//            .animation(.default, value: isActive)
    }
}
