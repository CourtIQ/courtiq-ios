//
//  RDTextField.swift
//
//
//  Created by Pranav Suri on 2024-08-03.
//

import SwiftUI

// MARK: - RDTextField
/// A custom text field view that supports various types, states, and configurations.
public struct RDTextField: View {
    
    // MARK: - Enums
    /// Enumeration defining the types of text fields.
    public enum RDTextFieldType {
        case primary, password, search
    }
    
    /// Enumeration defining the states of the text field with their associated styles.
    public enum RDTextFieldState {
        case normal, focused, error, success, disabled
    }
    
    // MARK: - Internal Properties
    @Binding public var value: String
    @Binding public var isEditing: Bool?
    
    // MARK: - Private Properties
    private var textFieldType: RDTextFieldType = .primary
    private var placeholder: String = ""
    private var helperText: String? = nil
    private var icon: (leadingIcon: Image?, trailingIcon: Image?)?
    private var onSubmit: () -> Void
    @State private var showPassword: Bool = false
    @FocusState private var focused: Bool {
        didSet {
            updateState()
        }
    }
    @State private var internalState: RDTextFieldState = .normal
    private var externalState: Binding<RDTextFieldState>?
    private var trailingAction: (() -> Void)?
    
    // MARK: - Initializer
    /// Initializes a new `RDTextField`.
    ///
    /// - Parameters:
    ///   - textFieldType: The type of the text field.
    ///   - placeholder: A string containing the placeholder text.
    ///   - icon: An optional tuple containing the leading and trailing icons.
    ///   - value: A binding to the text field's value.
    ///   - state: An optional binding to the text field's state.
    ///   - trailingAction: An optional closure to execute when the trailing icon is pressed.
    public init(
        textFieldType: RDTextFieldType,
        placeholder: String,
        icon: (leadingIcon: Image?, trailingIcon: Image?)? = nil,
        onSubmit: @escaping () -> Void = {},
        value: Binding<String>,
        state: Binding<RDTextFieldState>? = nil,
        isEditing: Binding<Bool>? = nil,
        trailingAction: (() -> Void)? = nil
    ) {
        self.textFieldType = textFieldType
        self.placeholder = placeholder
        self.icon = icon
        self.onSubmit = onSubmit
        self._value = value
        if let state = state {
            self.externalState = state
        }
        if let isEditing = isEditing {
            self._isEditing = Binding<Bool?>(
                get: { isEditing.wrappedValue },
                set: { isEditing.wrappedValue = $0 ?? false }
            )
        } else {
            self._isEditing = .constant(nil)
        }
        self.trailingAction = trailingAction
    }
    
    // MARK: - Body
    public var body: some View {
        let currentState = externalState?.wrappedValue ?? internalState
        let isActive = focused || value.count > 0
        
        if textFieldType == .search {
            searchTextField(currentState: currentState)
        } else {
            standardTextField(currentState: currentState, isActive: isActive)
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
                externalState.wrappedValue = .normal
            } else {
                internalState = .normal
            }
        }
    }
    
    private func searchTextField(currentState: RDTextFieldState) -> some View {
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
            .overlay(
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color.TokenColor.Semantic.Icon.default)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 8)
                        .disabled(true)
                    if isEditing == true && !value.isEmpty {
                        Button(action: {
                            value = ""
                        },
                        label: {
                            Image(systemName: "multiply.circle.fill")
                                .foregroundColor(.gray)
                                .padding(.trailing, 8)
                        })
                    }
                }
            )
            .onTapGesture {
                isEditing = true
            }
            .background(Color.TokenColor.Component.SearchField.background)
            .cornerRadius(10)
            if isEditing == true {
                Button(action: {
                    isEditing = false
                },
                label: {
                    Text("Cancel")
                        .rdBody()
                        .foregroundColor(Color.TokenColor.Semantic.Text.secondary)
                })
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }
    }
    
    private func standardTextField(currentState: RDTextFieldState, isActive: Bool) -> some View {
        VStack(spacing: 8) {
            HStack(spacing: 8) {
                leadingIconView(currentState: currentState)
                
                ZStack(alignment: .leading) {
                    Text(placeholder)
                        .dynamicNunitoSans(size: isActive ? 14 : 16, weight: isActive ? .bold : .regular)
                        .foregroundColor(currentState.placeholderColor)
                        .frame(height: 24)
                        .padding(.leading, 4)
                        .offset(y: isActive ? -12 : 0)
                        .animation(.default, value: isActive)
                    
                    if textFieldType == .password && !showPassword {
                        SecureField("", text: $value)
                            .rdBody()
                            .autocorrectionDisabled()
                            .foregroundColor(currentState.valueColor)
                            .offset(y: 7)
                            .padding(.leading, 4)
                            .focused($focused)
                    } else {
                        TextField("", text: $value)
                            .rdBody()
                            .autocorrectionDisabled()
                            .foregroundColor(currentState.valueColor)
                            .padding(.leading, 4)
                            .offset(y: 7)
                            .focused($focused)
                    }
                }
                
                trailingIconView(currentState: currentState)
            }
            .padding(.horizontal, 16)
            .frame(height: 56)
            .background(currentState.backgroundColor)
            .overlay(borderOverlay(currentState: currentState))
            
            if let helperText = helperText {
                helperTextView(currentState: currentState)
            }
        }
        .animation(.linear, value: focused)
        .onChange(of: focused) { _ in
            updateState()
        }
    }
    
    // MARK: - Subviews
    
    /// View for the leading icon.
    private func leadingIconView(currentState: RDTextFieldState) -> some View {
        Group {
            if let leadingIcon = icon?.leadingIcon {
                leadingIcon
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20)
                    .foregroundColor(externalState?.wrappedValue.iconColor ?? currentState.iconColor)
            }
        }
    }
    
    /// View for the trailing icon.
    private func trailingIconView(currentState: RDTextFieldState) -> some View {
        Group {
            if textFieldType == .password {
                Button(action: { showPassword.toggle() }) {
                    (showPassword
                     ? Image.Token.Icons.eyeOpen
                     : Image.Token.Icons.eyeClosed)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20)
                    .foregroundColor(externalState?.wrappedValue.actionIconColor ?? currentState.actionIconColor)
                }
            } else if let trailingIcon = icon?.trailingIcon {
                if let trailingAction = trailingAction {
                    Button(action: {
                        trailingAction()
                    }) {
                        trailingIcon
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20)
                            .foregroundColor(externalState?.wrappedValue.actionIconColor ?? currentState.actionIconColor)
                    }
                } else {
                    trailingIcon
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20)
                        .foregroundColor(externalState?.wrappedValue.iconColor ?? currentState.iconColor)
                }
            }
        }
    }
    
    /// View for the border overlay.
    private func borderOverlay(currentState: RDTextFieldState) -> some View {
        RoundedRectangle(cornerRadius: 12)
            .stroke(externalState?.wrappedValue.borderColor ?? currentState.borderColor, lineWidth: 1)
    }
    
    /// View for the helper text.
    private func helperTextView(currentState: RDTextFieldState) -> some View {
        HStack {
            Text(helperText ?? "")
                .rdSmallBody()
                .foregroundColor(externalState?.wrappedValue.helperTextColor ?? currentState.helperTextColor)
            Spacer()
        }
    }
}

// MARK: - Extensions for RDTextField.RDTextFieldState
extension RDTextField.RDTextFieldState {
    var backgroundColor: Color {
        switch self {
        case .normal, .focused, .success, .error:
            return Color.TokenColor.Semantic.Background.default
        case .disabled:
            return Color.Token.grey200
        }
    }
    
    var placeholderColor: Color {
        switch self {
        case .normal, .success, .error, .focused:
            return Color.TokenColor.Semantic.Text.primary
        case .disabled:
            return Color.Token.grey200
        }
    }
    
    var borderColor: Color {
        switch self {
        case .normal:
            return Color.TokenColor.Semantic.Border.default
        case .focused:
            return Color.TokenColor.Semantic.Border.focused
        case .success:
            return Color.TokenColor.Semantic.Border.success
        case .error:
            return Color.TokenColor.Semantic.Border.error
        case .disabled:
            return Color.Token.grey200
        }
    }
    
    var iconColor: Color {
        switch self {
        case .normal, .focused, .success, .error:
            return Color.TokenColor.Semantic.Icon.default
        case .disabled:
            return Color.Token.grey200
        }
    }
    
    var actionIconColor: Color {
        switch self {
        case .normal, .focused, .success, .error:
            return Color.TokenColor.Semantic.Icon.secondary
        case .disabled:
            return Color.Token.grey200
        }
    }
    
    var valueColor: Color {
        switch self {
        case .normal, .focused, .success, .error:
            return Color.TokenColor.Semantic.Text.default
        case .disabled:
            return Color.Token.grey400
        }
    }
    
    var helperTextColor: Color {
        switch self {
        case .normal, .focused, .success, .error:
            return Color.TokenColor.Semantic.Text.primary
        case .disabled:
            return Color.Token.grey200
        }
    }
}
