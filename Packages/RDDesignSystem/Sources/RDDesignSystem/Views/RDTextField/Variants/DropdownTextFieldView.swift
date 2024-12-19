//
//  SwiftUIView.swift
//  
//
//  Created by Pranav Suri on 2024-12-11.
//

import SwiftUI

struct DropdownTextFieldView: View {
    var placeholder: String
    var helperText: String?
    var leadingIcon: Image?
    @Binding var value: String
    @FocusState.Binding var focused: Bool
    var externalState: Binding<RDTextField.RDTextFieldState>?
    var dropdownItems: [DropdownItem]
    var onSubmit: () -> Void
    
    @State private var filteredItems: [DropdownItem] = []
    
    var body: some View {
        let currentState = externalState?.wrappedValue ?? (focused ? .focused : .normal)
        let isActive = focused || !value.isEmpty
        
        VStack(spacing: 8) {
            VStack {
                HStack(spacing: 8) {
                    RDIconView(icon: leadingIcon, color: currentState.iconColor)
                    
                    ZStack(alignment: .leading) {
                        RDPlaceholderView(
                            placeholder: placeholder,
                            isActive: isActive,
                            isDateType: false,
                            state: currentState
                        )
                        
                        TextField("", text: $value, onCommit: onSubmit)
                            .rdBody()
                            .autocorrectionDisabled()
                            .foregroundColor(currentState.valueColor)
                            .padding(.leading, 4)
                            .offset(y: 7)
                            .focused($focused)
                            .onChange(of: value) { _ in
                                filterDropdownItems()
                            }
                    }
                    
                    RDIconView(
                        icon: focused ? Image.Token.Icons.cross : Image.Token.Icons.dropdown,
                        color: currentState.actionIconColor,
                        action: {
                            if focused {
                                self.value = ""
                            } else {
                                focused = true
                            }
                        }
                    )
                }
                .padding(.top, (focused && !filteredItems.isEmpty) ? 12 : 0)
                
                if focused && !filteredItems.isEmpty {
                    RDDropdownListView(
                        items: filteredItems,
                        currentState: currentState
                    ) { selectedItem in
                        value = selectedItem.title
                        focused = false
                    }
                }
            }
            .padding(.horizontal, 16)
            .frame(minHeight: 56)
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
        .onAppear {
            filteredItems = dropdownItems
        }
    }
    
    private func filterDropdownItems() {
        if value.isEmpty || value == "" {
            filteredItems = dropdownItems
        } else {
            filteredItems = dropdownItems.filter { $0.title.lowercased().contains(value.lowercased()) }
        }
    }
}
