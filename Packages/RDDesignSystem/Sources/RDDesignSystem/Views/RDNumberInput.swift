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
    @Binding public var value: String
    @FocusState private var focused: Bool
    
    public var range: ClosedRange<Int>
    public var layout: Layout
    public var state: State
    
    // MARK: - Initializer
    
    public init(placeholder: String, helperText: String, value: Binding<String>, range: ClosedRange<Int>, layout: Layout = .horizontal, state: State = .standard) {
        self.placeholder = placeholder
        self.helperText = helperText
        self._value = value
        self.range = range
        self.layout = layout
        self.state = state
    }
    
    // MARK: - Body
    
    public var body: some View {
        let isActive = focused || !value.isEmpty
        
        switch layout {
        case .verticalLeading:
            VStack {
                HStack {
                    getStepper()
                    numberTextField
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .overlay(RoundedRectangle(cornerRadius: 12).strokeBorder(Color.gray))
                // TODO: Use Tokens
                if let helperText = helperText {
                    Text(helperText)
                        .foregroundColor(.primary)
                }
            }
            .frame(maxWidth: 150)
            
        case .verticalTrailing:
            VStack {
                getStepper()
                if let helperText = helperText {
                    Text(helperText)
                        .foregroundColor(.primary)
                }
            }
            
        case .horizontal:
            HStack {
                incrementStepper()
                decrementStepper()
                numberTextField
                if let helperText = helperText {
                    
                    Text(helperText)
                        .foregroundColor(.primary)
                }
            }
            
        case .withoutStepper:
            VStack {
                numberTextField
                if let helperText = helperText {
                    
                    Text(helperText)
                        .foregroundColor(.primary)
                }
            }
        }
    }
    
    // MARK: - Private Views
    
    private var numberTextField: some View {
        TextField("", text: $value)
            .multilineTextAlignment(.center)
            .rdPlaceholder(when: value.isEmpty, alignment: .center) {
                VStack(spacing: 8) {
                    Text(placeholder)
                        .foregroundColor(.secondary)
                        .offset(y: value.isEmpty ? 0 : -12)
                        .lineLimit(1)
                    if !value.isEmpty {
                        Spacer()
                    }
                }
            }
            .frame(height: 40)
            .offset(y: value.isEmpty ? 0 : 10)
            .focused($focused)
            .keyboardType(.numberPad)
            .onChange(of: value) { newValue in
                filterInput(newValue)
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
    }
    
    private func decrementStepper() -> some View {
        Button(action: decrementValue) {
            Image(systemName: "minus.circle")
        }
    }
    
    // MARK: - Private Methods
    
    private func incrementValue() {
        if let intValue = Int(value), intValue < range.upperBound {
            value = "\(intValue + 1)"
        }
    }
    
    private func decrementValue() {
        if let intValue = Int(value), intValue > range.lowerBound {
            value = "\(intValue - 1)"
        }
    }
    
    private func filterInput(_ input: String) {
        let filtered = input.filter { "0123456789".contains($0) }
        if filtered != input {
            value = filtered
        }
        
        if let number = Int(filtered), !range.contains(number) {
            value = String(filtered.prefix(while: { range.contains(Int(String($0))!) }))
        }
    }
    
    // MARK: - Enums
    
    public enum Layout {
        case verticalLeading, verticalTrailing, horizontal, withoutStepper
    }
    
    public enum State {
        case standard, focused, disabled, error, success
    }
}

// MARK: - Previews

struct RDNumberInput_Previews: PreviewProvider {
    static var previews: some View {
        StatefulPreviewWrapper("") { binding in
            AnyView(RDNumberInput(placeholder: "Enter value", helperText: "Helper text", value: binding, range: 1...10, layout: .verticalLeading))
        }
    }
}

// MARK: - Utility

struct StatefulPreviewWrapper<T: Equatable>: View {
    @State var value: T
    var content: (Binding<T>) -> AnyView
    
    init(_ value: T, @ViewBuilder content: @escaping (Binding<T>) -> AnyView) {
        self._value = State(wrappedValue: value)
        self.content = content
    }
    
    var body: some View {
        content($value)
    }
}

extension View {
    /**
     Modify the Textfield.
     
     - Returns: `Textfield` with `placeholder`
     */
    func rdPlaceholder<Content: View>(
        when _: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content
    ) -> some View {
        ZStack(alignment: alignment) {
            placeholder()
                .zIndex(-1)
                .disabled(true)
            self
        }
    }
}
