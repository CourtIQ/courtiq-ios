import SwiftUI

// MARK: - RDTextFieldUpdatedType
/// Enumeration defining the types of text fields.
public enum RDTextFieldUpdatedType {
    case primary, password, search
}

// MARK: - RDTextFieldUpdatedState
/// Enumeration defining the states of the text field with their associated styles.
public enum RDTextFieldUpdatedState {
    case normal, focused, error, success, disabled
    
    /// Background color for each state.
    public var backgroundColor: Color {
        switch self {
        case .normal, .focused, .success, .error:
            return Color.TokenColor.Semantic.Background.default
        case .disabled:
            return Color.Token.grey200
        }
    }
    
    /// Placeholder color for each state.
    public var placeholderColor: Color {
        switch self {
        case .normal, .success, .error:
            return Color.TokenColor.Semantic.Text.default
        case .focused:
            return Color.TokenColor.Semantic.Text.primary
        case .disabled:
            return Color.Token.grey200
        }
    }
    
    /// Border color for each state.
    public var borderColor: Color {
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
    
    /// Icon color for each state.
    public var iconColor: Color {
        switch self {
        case .normal, .focused, .success, .error:
            return Color.TokenColor.Semantic.Icon.default
        case .disabled:
            return Color.Token.grey200
        }
    }
    
    /// Action icon color for each state.
    public var actionIconColor: Color {
        switch self {
        case .normal, .focused, .success, .error:
            return Color.TokenColor.Semantic.Icon.secondary
        case .disabled:
            return Color.Token.grey200
        }
    }
    
    /// Value color for each state.
    public var valueColor: Color {
        switch self {
        case .normal, .focused, .success, .error:
            return Color.TokenColor.Semantic.Text.default
        case .disabled:
            return Color.Token.grey400
        }
    }
    
    /// Helper text color for each state.
    public var helperTextColor: Color {
        switch self {
        case .normal, .focused, .success, .error:
            return Color.TokenColor.Semantic.Text.primary
        case .disabled:
            return Color.Token.grey200
        }
    }
}

// MARK: - RDTextFieldUpdated
/// A custom text field view that supports various types, states, and configurations.
public struct RDTextFieldUpdated: View {
    
    // MARK: Properties
    var textFieldType: RDTextFieldUpdatedType = .primary
    var placeholder: String = ""
    var icon: (leadingIcon: Image?, trailingIcon: Image?)?
    @Binding public var value: String
    @Binding public var state: RDTextFieldUpdatedState
    @State private var showPassword: Bool = false
    @FocusState private var focused: Bool {
        didSet {
            updateState()
        }
    }
    public var trailingAction: (() -> Void)?
    
    // MARK: Initializer
    /// Initializes a new `RDTextFieldUpdated`.
    ///
    /// - Parameters:
    ///   - textFieldType: The type of the text field.
    ///   - placeholder: A string containing the placeholder text.
    ///   - icon: An optional tuple containing the leading and trailing icons.
    ///   - value: A binding to the text field's value.
    ///   - state: A binding to the text field's state.
    ///   - trailingAction: An optional closure to execute when the trailing icon is pressed.
    public init(
        textFieldType: RDTextFieldUpdatedType,
        placeholder: String,
        icon: (leadingIcon: Image?, trailingIcon: Image?)? = nil,
        value: Binding<String>,
        state: Binding<RDTextFieldUpdatedState>,
        trailingAction: (() -> Void)? = nil
    ) {
        self.textFieldType = textFieldType
        self.icon = icon
        self._value = value
        self._state = state
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
        
        VStack(spacing: 8) {
            HStack {
                leadingIconView
                
                ZStack {
                    if textFieldType == .password && !showPassword {
                        SecureField("", text: $value)
                            .rdBody()
                            .foregroundColor(state.valueColor)
                            .offset(y: 7)
                            .focused($focused)
                    } else {
                        TextField("", text: $value)
                            .rdBody()
                            .foregroundColor(state.valueColor)
                            .offset(y: 7)
                            .focused($focused)
                    }
                    
                    placeholderView(isActive: isActive)
                }
                
                trailingIconView
            }
            .padding(.horizontal, 16)
            .frame(height: 56)
            .background(state.backgroundColor)
            .overlay(borderOverlay)
            
            helperTextView
        }
        .animation(.linear, value: focused)
        .onChange(of: focused) { _ in
            updateState()
        }
    }
    
    // MARK: - Subviews
    
    /// View for the leading icon.
    private var leadingIconView: some View {
        Group {
            if let leadingIcon = icon?.leadingIcon {
                leadingIcon
                    .frame(width: 24, height: 24)
                    .foregroundColor(state.iconColor)
            }
        }
    }
    
    /// View for the trailing icon.
    private var trailingIconView: some View {
        Group {
            if textFieldType == .password {
                Button(action: { showPassword.toggle() }) {
                    Image(systemName: showPassword ? "eye.slash" : "eye")
                        .frame(width: 24, height: 24)
                        .foregroundColor(state.actionIconColor)
                }
            } else if let trailingIcon = icon?.trailingIcon {
                if let trailingAction = trailingAction {
                    Button(action: {
                        trailingAction()
                    }) {
                        trailingIcon
                            .frame(width: 24, height: 24)
                            .foregroundColor(state.actionIconColor)
                    }
                } else {
                    trailingIcon
                        .frame(width: 24, height: 24)
                        .foregroundColor(state.iconColor)
                }
            }
        }
    }
    
    /// View for the placeholder.
    ///
    /// - Parameters:
    ///   - isActive: A boolean indicating whether the text field is active.
    private func placeholderView(isActive: Bool) -> some View {
        HStack {
            Text("Test")
                .dynamicNunitoSans(size: isActive ? 12 : 16, weight: isActive ? .bold : .regular)
                .foregroundColor(state.placeholderColor)
                .frame(height: 24)
                .offset(y: isActive ? -12 : 0)
                .onTapGesture {
                    focused = true
                }
            Spacer()
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
            Text(placeholder)
                .rdCaption()
                .foregroundColor(state.helperTextColor)
            Spacer()
        }
    }
}
