//
//  PasswordTextFieldView.swift
//  
//
//  Created by Pranav Suri on 2024-12-11.
//

import SwiftUI

struct PasswordTextFieldView: View {
    var placeholder: String
    var helperText: String?
    var leadingIcon: Image?
    @Binding var value: String
    @FocusState.Binding var focused: Bool
    var externalState: Binding<RDTextField.RDTextFieldState>?
    var onSubmit: () -> Void
    
    @State private var showPassword: Bool = false
    
    var body: some View {
        let currentState = externalState?.wrappedValue ?? (focused ? .focused : .normal)
        let isActive = focused || !value.isEmpty
        
        VStack(spacing: 8) {
            HStack(spacing: 8) {
                RDIconView(icon: leadingIcon, color: currentState.iconColor)
                
                ZStack(alignment: .leading) {
                    RDPlaceholderView(placeholder: placeholder, isActive: isActive, isDateType: false, state: currentState)
                    
                    if showPassword {
                        TextField("", text: $value, onCommit: onSubmit)
                            .rdBody()
                            .autocorrectionDisabled()
                            .foregroundColor(currentState.valueColor)
                            .padding(.leading, 4)
                            .offset(y: 7)
                            .focused($focused)
                    } else {
                        SecureField("", text: $value, onCommit: onSubmit)
                            .rdBody()
                            .autocorrectionDisabled()
                            .foregroundColor(currentState.valueColor)
                            .padding(.leading, 4)
                            .offset(y: 7)
                            .focused($focused)
                    }
                }
                
                RDIconView(
                    icon: showPassword ? Image.Token.Icons.eyeOpen : Image.Token.Icons.eyeClosed,
                    color: currentState.actionIconColor,
                    action: { showPassword.toggle() }
                )
            }
            .frame(minHeight: 56)
            .padding(.horizontal, 16)
            .background(currentState.backgroundColor)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(currentState.borderColor, lineWidth: 1)
            )
            
            if let helperText = helperText {
                RDHelperTextView(text: helperText, color: currentState.helperTextColor)
            }
        }
        .animation(.linear, value: focused)
    }
}
