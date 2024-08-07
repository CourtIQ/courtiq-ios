//
//  RDNumberInput.swift
//
//
//  Created by Pranav Suri on 2024-07-29.
//

import SwiftUI

/// A view that represents a number input field with optional stepper controls and helper text.
public struct RDNumberInput: View {
    // MARK: - Properties
    
    public var placeholder: String
    public var helperText: String?
    @Binding public var value: Int
    @Binding public var state: FieldState
    @FocusState private var focused: Bool
    
    public var range: ClosedRange<Int>
    public var layout: Layout
    public var fixedWidth: Bool = true
    
    // MARK: - Initializer
    
    public init(
        placeholder: String,
        helperText: String? = nil,
        value: Binding<Int>,
        range: ClosedRange<Int>,
        layout: Layout = .horizontal,
        state: Binding<FieldState>,
        fixedWidth: Bool = true
    ) {
        self.placeholder = placeholder
        self.helperText = helperText
        self._value = value
        self.range = range
        self.layout = layout
        self._state = state
        self.fixedWidth = fixedWidth
    }
    
    // MARK: - Body
    
    public var body: some View {
        VStack {
            Group {
                switch layout {
                case .verticalLeading:
                    HStack {
                        getStepper()
                        numberTextField
                    }
                case .verticalTrailing:
                    HStack {
                        numberTextField
                        getStepper()
                    }
                case .horizontal:
                    HStack {
                        decrementStepper()
                        numberTextField
                        incrementStepper()
                    }
                    
                case .withoutStepper:
                    numberTextField
                }
                
                
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .frame(height: 56)
            .overlay(RoundedRectangle(cornerRadius: 12).stroke(state.borderColor, lineWidth: 1))
            .background(state.bgColor.clipShape(RoundedRectangle(cornerRadius: 12)))
            .frame(maxWidth: fixedWidth ? 150 : .infinity)
            
            if let helperText = helperText {
                HStack {
                    Text(helperText)
                        .rdSmallBody()
                        .foregroundColor(state.placeholderColor)
                    Spacer()
                }
            }
        }
    }
    
    // MARK: - Private Views
    
    private var numberTextField: some View {
        VStack {
            Text(placeholder)
                .rdSmallBodyBold()
                .foregroundStyle(state.placeholderColor)
                .offset(y: 4)
            
            TextField("", text: Binding(
                get: { String(value) },
                set: { newValue in
                    filterInput(newValue)
                }))
            .rdBody()
            .foregroundColor(state.valueColor)
            .multilineTextAlignment(.center)
            .focused($focused)
            .keyboardType(.numberPad)
            .disableAutocorrection(true)
            .onChange(of: focused) { isFocused in
                state = isFocused ? .focused : .standard
            }
            .onChange(of: value) { newValue in
                filterInput(String(newValue))
            }
            .offset(y: -8)
        }
    }
    
    private func getStepper() -> some View {
        VStack(spacing: 4) {
            incrementStepper()
            decrementStepper()
        }
        .foregroundColor(.primary)
    }
    
    private func incrementStepper() -> some View {
        Button(action: incrementValue) {
            Image(systemName: "plus.circle")
        }
        .foregroundColor(state.iconColor)
    }
    
    private func decrementStepper() -> some View {
        Button(action: decrementValue) {
            Image(systemName: "minus.circle")
        }
        .foregroundColor(state.iconColor)
    }
    
    // MARK: - Private Methods
    
    private func incrementValue() {
        if value < range.upperBound {
            value += 1
        }
    }
    
    private func decrementValue() {
        if value > range.lowerBound {
            value -= 1
        }
    }
    
    private func filterInput(_ input: String) {
        let filtered = input.filter { "0123456789".contains($0) }
        if let number = Int(filtered), range.contains(number) {
            value = number
        } else if let number = Int(filtered), number < range.lowerBound {
            value = range.lowerBound
        } else if let number = Int(filtered), number > range.upperBound {
            value = range.upperBound
        }
    }
    
    // MARK: - Enums
    
    public enum Layout {
        case verticalLeading, verticalTrailing, horizontal, withoutStepper
    }
    
    public enum FieldState {
        case standard, focused, disabled, error, success
    }
}

// MARK: - Extensions for RDNumberInput.FieldState

extension RDNumberInput.FieldState {
    
    var bgColor: Color {
        switch self {
        case .standard, .error, .success, .focused:
            return Color.TokenColor.Semantic.Background.default
        case .disabled:
            return Color.TokenColor.Semantic.Background.disabled
        }
    }
    
    var borderColor: Color {
        switch self {
        case .standard:
            return Color.TokenColor.Semantic.Border.default
        case .disabled:
            return Color.TokenColor.Semantic.Border.disabled
        case .error:
            return Color.TokenColor.Semantic.Border.error
        case .success:
            return Color.TokenColor.Semantic.Border.success
        case .focused:
            return Color.TokenColor.Semantic.Border.focused
        }
    }
    
    var valueColor: Color {
        switch self {
        case .standard, .focused, .error, .success:
            return Color.TokenColor.Semantic.Text.primary
        case .disabled:
            return Color.TokenColor.Semantic.Text.primary
        }
    }
    
    var iconColor: Color {
        switch self {
        case .standard, .focused, .error, .success:
            return Color.TokenColor.Semantic.Text.primary
        case .disabled:
            return Color.TokenColor.Semantic.Text.primary
        }
    }
    
    var placeholderColor: Color {
        switch self {
        case .standard, .focused, .error, .success:
            return Color.TokenColor.Semantic.Text.primary
        case .disabled:
            return Color.TokenColor.Semantic.Text.default
        }
    }
}
