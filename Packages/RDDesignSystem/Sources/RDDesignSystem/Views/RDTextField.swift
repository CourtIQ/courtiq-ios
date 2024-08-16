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
        case primary, password, search, date, dropdown
    }
    
    /// Enumeration defining the states of the text field with their associated styles.
    public enum RDTextFieldState {
        case normal, focused, error, success, disabled
    }
    
    // MARK: - Internal
    
    @Binding public var value: String
    @Binding public var isEditing: Bool?
    @Binding public var dateValue: Date?

    // MARK: - Private
    
    private var textFieldType: RDTextFieldType = .primary
    private var placeholder: String = ""
    private var helperText: String? = nil
    private var icon: (leadingIcon: Image?, trailingIcon: Image?)?
    private var onSubmit: () -> Void
    private var dropdownItems: [DropdownItem] = []
    @State private var showPassword: Bool = false
    @State private var filteredItems: [DropdownItem] = []
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
        helperText: String? = nil,
        icon: (leadingIcon: Image?, trailingIcon: Image?)? = nil,
        onSubmit: @escaping () -> Void = {},
        value: Binding<String>,
        dateValue: Binding<Date?> = .constant(nil),
        dropdownItems: [DropdownItem] = [], // New parameter for dropdown items
        state: Binding<RDTextFieldState>? = nil,
        isEditing: Binding<Bool>? = nil,
        trailingAction: (() -> Void)? = nil
    ) {
        self.textFieldType = textFieldType
        self.placeholder = placeholder
        self.helperText = helperText
        self.icon = icon
        self.onSubmit = onSubmit
        self._value = value
        self._dateValue = dateValue
        self.dropdownItems = dropdownItems
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
        self._filteredItems = State(initialValue: dropdownItems) // Initialize with all items
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
    
    private func filterDropdownItems() {
        if value.isEmpty {
            filteredItems = dropdownItems
        } else {
            filteredItems = dropdownItems.filter { $0.title.lowercased().contains(value.lowercased()) }
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
            VStack {
                HStack(spacing: 8) {
                    leadingIconView(currentState: currentState)
                    
                    ZStack(alignment: .leading) {
                        HStack {
                            if textFieldType == .date {
                                Spacer()
                            }
                            
                            Text(placeholder)
                                .dynamicNunitoSans(size: isActive || textFieldType == .date ? 14 : 16,
                                                   weight: isActive || textFieldType == .date ? .bold : .regular)
                                .foregroundColor(currentState.placeholderColor)
                                .frame(height: 24)
                                .padding(.leading, 4)
                                .offset(y: isActive || textFieldType == .date ? -12 : 0)
                                .offset(y: textFieldType == .date ? -4 : 0)
                                .animation(.default, value: isActive)
                            
                            if textFieldType == .date {
                                Spacer()
                            }
                        }

                        if textFieldType == .password && !showPassword {
                            SecureField("", text: $value)
                                .rdBody()
                                .autocorrectionDisabled()
                                .foregroundColor(currentState.valueColor)
                                .offset(y: 7)
                                .padding(.leading, 4)
                                .focused($focused)
                                
                        } else if textFieldType == .date {
                            HStack{
                                Spacer()
                                DatePicker(
                                    "",
                                    selection: Binding(
                                        get: { dateValue ?? Date() },
                                        set: { dateValue = $0; value = formatDate($0) }
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
                                .background(Color.clear)
            
                                Spacer()
                            }

                        } else {
                            TextField("", text: $value)
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
                    }
                    
                    trailingIconView(currentState: currentState)
                }
                .padding(.top, textFieldType == .dropdown && focused && !filteredItems.isEmpty ? 12 : 0)
                
                if textFieldType == .dropdown && focused == true && !filteredItems.isEmpty {
                    ScrollView(.vertical) {
                        ForEach(filteredItems) { item in
                            HStack {
                                item.image
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                Text(item.title)
                                    .rdBody()
                                    .foregroundColor(currentState.valueColor)
                                Spacer()
                            }
                            .background(currentState.backgroundColor)
                            .onTapGesture {
                                value = item.title
                                focused = false
                            }
                            Divider()
                        }
                    }
                    .frame(maxHeight: 80)
                }
            }
            .padding(.horizontal, 16)
            .frame(minHeight: 56)
            .background(currentState.backgroundColor)
            .overlay(        RoundedRectangle(cornerRadius: 12)
                .stroke(externalState?.wrappedValue.borderColor ?? currentState.borderColor, lineWidth: 1))
            
            if helperText != nil {
                helperTextView(currentState: currentState)
            }
        }
        .animation(.linear, value: focused)
        .onChange(of: focused) { _ in
            updateState()
        }
    }

    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
    
    // MARK: - Subviews
    
    /// View for the leading icon.
    @ViewBuilder
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
    @ViewBuilder
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
            } else if textFieldType == .dropdown {
                if focused {
                    Button {
                        self.value = ""
                    } label: {
                        Image.Token.Icons.cross
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20)
                            .foregroundColor(externalState?.wrappedValue.actionIconColor ?? currentState.actionIconColor)
                    }
                } else {
                    Button {
                        focused = true

                    } label: {
                        Image.Token.Icons.dropdown
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20)
                            .foregroundColor(externalState?.wrappedValue.actionIconColor ?? currentState.actionIconColor)
                    }
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
    @ViewBuilder
    private func borderOverlay(currentState: RDTextFieldState) -> some View {
        RoundedRectangle(cornerRadius: 12)
            .stroke(externalState?.wrappedValue.borderColor ?? currentState.borderColor, lineWidth: 1)
    }
    
    /// View for the helper text.
    @ViewBuilder
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

public struct DropdownItem: Identifiable {
    public var id = UUID()
    public var image: Image
    public var title: String

    public init(id: UUID = UUID() ,image: Image, title: String) {
        self.id = id
        self.image = image
        self.title = title
    }
}
