//
//  RDNumberInput.swift
//
//
//  Created by Pranav Suri on 2024-07-29.
//

import SwiftUI

// MARK: - RDNumberInput
/// A view that represents a number input field with optional stepper controls and helper text.
public struct RDNumberInput: View {
    
    // MARK: - Enums
    /// Layout options for the number input field.
    public enum Layout {
        case verticalLeading, verticalTrailing, horizontal, withoutStepper
    }
    
    /// Enumeration defining the states of the input field with their associated styles.
    public enum FieldState {
        case standard, focused, disabled, error, success
    }
    
    // MARK: - Internal Properties
    @Binding public var value: Int
    
    // MARK: - Private Properties
    private var placeholder: String
    private var helperText: String?
    private var range: ClosedRange<Int>
    private var layout: Layout
    private var fixedWidth: Bool
    @FocusState private var focused: Bool
    @State private var internalState: FieldState = .standard
    private var externalState: Binding<FieldState>?

    // MARK: - Initializer
    /// Initializes a new `RDNumberInput`.
    ///
    /// - Parameters:
    ///   - placeholder: A string containing the placeholder text.
    ///   - helperText: An optional string containing helper text.
    ///   - value: A binding to the number input's value.
    ///   - range: The valid range for the input value.
    ///   - layout: The layout of the input field (default is `.horizontal`).
    ///   - state: An optional binding to the input field's state.
    ///   - fixedWidth: A boolean indicating if the field should have a fixed width (default is `true`).
    public init(
        placeholder: String,
        helperText: String? = nil,
        value: Binding<Int>,
        range: ClosedRange<Int>,
        layout: Layout = .horizontal,
        state: Binding<FieldState>? = nil,
        fixedWidth: Bool = true
    ) {
        self.placeholder = placeholder
        self.helperText = helperText
        self._value = value
        self.range = range
        self.layout = layout
        self.fixedWidth = fixedWidth
        if let state = state {
            self.externalState = state
        }
    }
    
    // MARK: - Body
    public var body: some View {
        let currentState = externalState?.wrappedValue ?? internalState
        
        VStack {
            Group {
                switch layout {
                case .verticalLeading:
                    HStack {
                        getStepper(currentState: currentState)
                        numberTextField(currentState: currentState)
                    }
                case .verticalTrailing:
                    HStack {
                        numberTextField(currentState: currentState)
                        getStepper(currentState: currentState)
                    }
                case .horizontal:
                    HStack {
                        decrementStepper(currentState: currentState)
                        numberTextField(currentState: currentState)
                        incrementStepper(currentState: currentState)
                    }
                case .withoutStepper:
                    numberTextField(currentState: currentState)
                }
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .frame(height: 56)
            .overlay(RoundedRectangle(cornerRadius: 12).stroke(currentState.borderColor, lineWidth: 1))
            .background(currentState.bgColor.clipShape(RoundedRectangle(cornerRadius: 12)))
            .frame(maxWidth: fixedWidth ? 150 : .infinity)
            
            if let helperText = helperText {
                HStack {
                    Text(helperText)
                        .rdSmallBody()
                        .foregroundColor(currentState.placeholderColor)
                    Spacer()
                }
            }
        }
        .onChange(of: focused) { _ in
            updateState()
        }
    }
    
    // MARK: - Private Methods
    
    private func updateState() {
        if focused {
            if let externalState = externalState {
                externalState.wrappedValue = .focused
            } else {
                internalState = .focused
            }
        } else {
            if let externalState = externalState {
                externalState.wrappedValue = .standard
            } else {
                internalState = .standard
            }
        }
    }
    
    private func numberTextField(currentState: FieldState) -> some View {
        VStack {
            Text(placeholder)
                .rdSmallBodyBold()
                .foregroundStyle(currentState.placeholderColor)
                .offset(y: 4)
            
            TextField("", text: Binding(
                get: { String(value) },
                set: { newValue in
                    filterInput(newValue)
                }))
            .rdBody()
            .foregroundColor(currentState.valueColor)
            .multilineTextAlignment(.center)
            .focused($focused)
            .keyboardType(.numberPad)
            .disableAutocorrection(true)
            .onChange(of: focused) { _ in
                updateState()
            }
            .onChange(of: value) { newValue in
                filterInput(String(newValue))
            }
            .offset(y: -8)
        }
    }
    
    private func getStepper(currentState: FieldState) -> some View {
        VStack(spacing: 4) {
            incrementStepper(currentState: currentState)
            decrementStepper(currentState: currentState)
        }
        .foregroundColor(.primary)
    }
    
    private func incrementStepper(currentState: FieldState) -> some View {
        Button(action: incrementValue) {
            Image(systemName: "plus.circle")
        }
        .foregroundColor(currentState.iconColor)
    }
    
    private func decrementStepper(currentState: FieldState) -> some View {
        Button(action: decrementValue) {
            Image(systemName: "minus.circle")
        }
        .foregroundColor(currentState.iconColor)
    }
    
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
            return Color.TokenColor.Semantic.Text.default
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
