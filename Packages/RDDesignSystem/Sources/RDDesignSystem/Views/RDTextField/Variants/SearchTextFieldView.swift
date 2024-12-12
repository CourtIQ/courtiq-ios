//
//  SearchTextFieldView.swift
//
//
//  Created by Pranav Suri on 2024-12-11.
//

import SwiftUI

struct SearchTextFieldView: View {
    var placeholder: String
    @Binding var value: String
    @Binding var isEditing: Bool
    var onSubmit: () -> Void
    
    var body: some View {
        HStack {
            TextField(placeholder, text: $value, onCommit: {
                onSubmit()
                isEditing = false
            })
            .rdBody()
            .autocorrectionDisabled()
            .foregroundColor(Color.TokenColor.Semantic.Text.default)
            .padding(7)
            .padding(.horizontal, 25)
            .cornerRadius(8)
            .onTapGesture {
                isEditing = true
            }
            .overlay(
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color.TokenColor.Semantic.Icon.default)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 8)
                        .disabled(true)
                    if isEditing && !value.isEmpty {
                        Button(action: {
                            value = ""
                        }) {
                            Image(systemName: "multiply.circle.fill")
                                .foregroundColor(.gray)
                                .padding(.trailing, 8)
                        }
                    }
                }
            )
            .background(Color.TokenColor.Component.SearchField.background)
            .cornerRadius(10)
            
            if isEditing {
                Button(action: {
                    isEditing = false
                }) {
                    Text("Cancel")
                        .rdBody()
                        .foregroundColor(Color.TokenColor.Semantic.Text.secondary)
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default, value: isEditing)
            }
        }
    }
}
