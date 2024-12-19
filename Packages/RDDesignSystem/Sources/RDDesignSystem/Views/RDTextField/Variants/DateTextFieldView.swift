//
//  SwiftUIView 2.swift
//  
//
//  Created by Pranav Suri on 2024-12-11.
//

import SwiftUI

struct DateTextFieldView: View {
    var placeholder: String
    var helperText: String?
    var leadingIcon: Image?
    @Binding var value: String
    @Binding var dateValue: Date?
    @FocusState.Binding var focused: Bool
    var externalState: Binding<RDTextField.RDTextFieldState>?
    
    var body: some View {
        let currentState = externalState?.wrappedValue ?? (focused ? .focused : .normal)
        let isActive = focused || !value.isEmpty
        
        VStack(spacing: 8) {
            HStack(spacing: 8) {
                RDIconView(icon: leadingIcon, color: currentState.iconColor)
                
                ZStack(alignment: .leading) {
                    RDPlaceholderView(placeholder: placeholder, isActive: isActive, isDateType: true, state: currentState)
                    
                    HStack(alignment: .center) {
                        DatePicker(
                            "",
                            selection: Binding(
                                get: { dateValue ?? Date() },
                                set: { newDate in
                                    dateValue = newDate
                                    value = formatDate(newDate)
                                }
                            ),
                            displayedComponents: .date
                        )
                        .rdBody()
                        .foregroundStyle(currentState.valueColor)
                        .datePickerStyle(.compact)
                        .labelsHidden()
                        .accentColor(currentState.valueColor)
                        .offset(y: 8)
                        .padding(.leading, 4)
                        .focused($focused)
                        
                        // Clear Button (only shown if a date is selected)
                        if dateValue != nil {
                            Button(action: clearDate) {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(currentState.iconColor)
                            }
                            .padding(.trailing, 4)
                        }
                    }
                }
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
    
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
    
    private func clearDate() {
        dateValue = nil
        value = ""
        // Unfocus if needed
        focused = false
    }
}
