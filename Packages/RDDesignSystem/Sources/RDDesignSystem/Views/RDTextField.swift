//
//  SwiftUIView.swift
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
    
    // MARK: Properties
    var textFieldType: RDTextFieldType = .primary
    var placeholder: String = ""
    var helperText: String? = nil
    var icon: (leadingIcon: Image?, trailingIcon: Image?)?
    private var onSubmit: () -> Void
    @Binding public var value: String
    @Binding public var state: RDTextFieldState
    @Binding public var isEditing: Bool?
    @State private var showPassword: Bool = false
    @FocusState private var focused: Bool {
        didSet {
            updateState()
        }
    }
    public var trailingAction: (() -> Void)?
    
    // MARK: Initializer
    /// Initializes a new `RDTextField`.
    ///
    /// - Parameters:
    ///   - textFieldType: The type of the text field.
    ///   - placeholder: A string containing the placeholder text.
    ///   - icon: An optional tuple containing the leading and trailing icons.
    ///   - value: A binding to the text field's value.
    ///   - state: A binding to the text field's state.
    ///   - trailingAction: An optional closure to execute when the trailing icon is pressed.
    public init(
        textFieldType: RDTextFieldType,
        placeholder: String,
        icon: (leadingIcon: Image?, trailingIcon: Image?)? = nil,
        onSubmit: @escaping () -> Void = {},
        value: Binding<String>,
        state: Binding<RDTextFieldState>,
        isEditing: Binding<Bool>? = nil,
        trailingAction: (() -> Void)? = nil
    ) {
        self.textFieldType = textFieldType
        self.placeholder = placeholder
        self.icon = icon
        self.onSubmit = onSubmit
        self._value = value
        self._state = state
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
    
    // MARK: - Update State
    /// Updates the text field's state based on the focus state.
    private func updateState() {
        if focused {
            state = .focused
        } else {
            state = .normal
        }
    }
    
    // MARK: - Body
    public var body: some View {
        let isActive = focused || value.count > 0
        
        if textFieldType == .search {
            HStack {
                TextField(placeholder, text: $value, onCommit: {
                    onSubmit()
                    isEditing = false
                })
                .rdBody()
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
            
        } else {
            VStack(spacing: 8) {
                HStack(spacing: 8) {
                    leadingIconView
                    
                    ZStack(alignment: .leading) {
                        Text(placeholder)
                            .dynamicNunitoSans(size: isActive ? 14 : 16, weight: isActive ? .bold : .regular)
                            .foregroundColor(state.placeholderColor)
                            .frame(height: 24)
                            .padding(.leading, 4)
                            .offset(y: isActive ? -12 : 0)
                            .animation(.default, value: isActive)
                        
                        if textFieldType == .password && !showPassword {
                            SecureField("", text: $value)
                                .rdBody()
                                .foregroundColor(state.valueColor)
                                .offset(y: 7)
                                .padding(.leading, 4)
                                .focused($focused)
                        } else {
                            TextField("", text: $value)
                                .rdBody()
                                .foregroundColor(state.valueColor)
                                .padding(.leading, 4)
                                .offset(y: 7)
                                .focused($focused)
                        }
                    }
                    
                    trailingIconView
                }
                .padding(.horizontal, 16)
                .frame(height: 56)
                .background(state.backgroundColor)
                .overlay(borderOverlay)
                
                if let helperText = helperText {
                    helperTextView
                }
            }
            .animation(.linear, value: focused)
            .onChange(of: focused) { _ in
                updateState()
            }
        }
    }
    
    // MARK: - Subviews
    
    /// View for the leading icon.
    private var leadingIconView: some View {
        Group {
            if let leadingIcon = icon?.leadingIcon {
                leadingIcon
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20)
                    .foregroundColor(state.iconColor)
            }
        }
    }
    
    /// View for the trailing icon.
    private var trailingIconView: some View {
        Group {
            if textFieldType == .password {
                Button(action: { showPassword.toggle() }) {
                    (showPassword
                     ? Image.Token.Icons.eyeOpen
                     : Image.Token.Icons.eyeClosed)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20)
                    .foregroundColor(state.actionIconColor)
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
                            .foregroundColor(state.actionIconColor)
                    }
                } else {
                    trailingIcon
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20)
                        .foregroundColor(state.iconColor)
                }
            }
        }
    }
    
    /// View for the border overlay.
    private var borderOverlay: some View {
        RoundedRectangle(cornerRadius: 12)
            .stroke(state.borderColor, lineWidth: 1)
    }
    
    /// View for the helper text.
    private var helperTextView: some View {
        HStack {
            Text(helperText ?? "")
                .rdSmallBody()
                .foregroundColor(state.helperTextColor)
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
