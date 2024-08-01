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
    @FocusState private var focused: Bool
    
    public var range: ClosedRange<Int>
    public var layout: Layout
    public var state: State
    public var fixedWidth: Bool = true
    
    // MARK: - Initializer
    
    public init(
        placeholder: String,
        helperText: String? = nil,
        value: Binding<Int>,
        range: ClosedRange<Int>,
        layout: Layout = .horizontal,
        state: State = .standard,
        fixedWidth: Bool = true
    ) {
        self.placeholder = placeholder
        self.helperText = helperText
        self._value = value
        self.range = range
        self.layout = layout
        self.state = state
        self.fixedWidth = fixedWidth
    }
    
    // MARK: - Body
    
    public var body: some View {
        
        Group {
            VStack{
                switch layout {
                case .verticalLeading:
                    VStack {
                        HStack {
                            getStepper()
                            numberTextField
                        }
                        
                        if let helperText = helperText {
                            Text(helperText)
                                .foregroundColor(.primary)
                        }
                    }
                    
                case .verticalTrailing:
                    VStack {
                        HStack {
                            numberTextField
                            getStepper()
                        }
                        if let helperText = helperText {
                            Text(helperText)
                                .foregroundColor(.primary)
                        }
                    }
                case .horizontal:
                    HStack {
                        decrementStepper()
                        numberTextField
                        if let helperText = helperText {
                            Text(helperText)
                                .foregroundColor(.primary)
                        }
                        incrementStepper()
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
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .overlay(RoundedRectangle(cornerRadius: 12).stroke(state.borderColor, lineWidth: 1))
            .background(state.bgColor.clipShape(RoundedRectangle(cornerRadius: 12)))
            .frame(maxWidth: fixedWidth ? 150 : .infinity)
        }
    }
    
    // MARK: - Private Views
    
    private var numberTextField: some View {
        TextField("", text: Binding(
            get: { String(value) },
            set: { newValue in
                filterInput(newValue)
            })
        )
        .rdBody()
        .foregroundColor(state.valueColor)
        .multilineTextAlignment(.center)
        .rdPlaceholder(when: String(value).isEmpty, alignment: .center) {
            VStack(spacing: 8) {
                Text(placeholder)
                    .rdSmallBody()
                    .foregroundColor(state.placeholderColor)
                    .offset(y: String(value).isEmpty ? 0 : -12)
                    .lineLimit(1)
                if !String(value).isEmpty {
                    Spacer()
                }
            }
        }
        .frame(height: 40)
        .offset(y: String(value).isEmpty ? 0 : 10)
        .focused($focused)
        .keyboardType(.numberPad)
        .disableAutocorrection(true)
        .onChange(of: value) { newValue in
            filterInput(String(newValue))
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
        }
    }
    
    // MARK: - Enums
    
    public enum Layout {
        case verticalLeading, verticalTrailing, horizontal, withoutStepper
    }
    
    public enum State: CaseIterable, Identifiable {
        public var id: Self { self }
        case standard, focused, disabled, error, success
    }
}

// MARK: - Previews

struct RDNumberInput_Previews: PreviewProvider {
    static var previews: some View {
        StatefulPreviewWrapper(0) { binding in
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

// MARK: - RDNumberInputState

extension RDNumberInput.State {
    
    var bgColor: Color {
        switch self {
        case .standard, .error, .success, .focused:
            return Color.TokenColor.Semantic.Background.primary
        case .disabled:
            return Color.TokenColor.Semantic.Background.disabled
        }
    }
    
    var borderColor: Color {
        switch self {
        case .standard:
            return Color.TokenColor.Semantic.Border.primary
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
            Color.TokenColor.Semantic.Label.primary
        case .disabled:
            Color.TokenColor.Semantic.Label.disabledPrimary
        }
    }
    
    var iconColor: Color {
        switch self {
        case .standard, .focused, .error, .success:
            Color.TokenColor.Semantic.Label.primary
        case .disabled:
            Color.TokenColor.Semantic.Label.disabledPrimary
        }
    }
    
    var placeholderColor: Color {
        switch self {
        case .standard, .focused, .error, .success:
            Color.TokenColor.Semantic.Label.secondary
        case .disabled:
            Color.TokenColor.Semantic.Label.disabledSecondary
        }
    }
}
