//
//  RDTextField.swift
//
//  Created by Pranav Suri on 2024-08-03.
//

import SwiftUI

// MARK: - RDTextField
public struct RDTextField: View {
    
    // MARK: - Enums
    public enum RDTextFieldType {
        case primary, password, search, date, dropdown
    }
    
    public enum RDTextFieldState {
        case normal, focused, error, success, disabled
    }
    
    // MARK: - Internal Bindings
    @Binding public var value: String
    @Binding public var isEditing: Bool?
    @Binding public var dateValue: Date?

    // MARK: - Private Properties
    private var textFieldType: RDTextFieldType
    private var placeholder: String
    private var helperText: String?
    private var leadingIcon: Image?
    private var trailingIcon: Image?
    private var onSubmit: () -> Void
    private var dropdownItems: [DropdownItem]
    private var externalState: Binding<RDTextFieldState>?
    private var trailingAction: (() -> Void)?
    
    @FocusState private var focused: Bool
    @State private var internalState: RDTextFieldState = .normal
    
    // MARK: - Initializer
    public init(
        textFieldType: RDTextFieldType,
        placeholder: String,
        helperText: String? = nil,
        leadingIcon: Image? = nil,
        trailingIcon: Image? = nil,
        onSubmit: @escaping () -> Void = {},
        value: Binding<String>,
        dateValue: Binding<Date?> = .constant(nil),
        dropdownItems: [DropdownItem] = [],
        state: Binding<RDTextFieldState>? = nil,
        isEditing: Binding<Bool>? = nil,
        trailingAction: (() -> Void)? = nil
    ) {
        self.textFieldType = textFieldType
        self.placeholder = placeholder
        self.helperText = helperText
        self.leadingIcon = leadingIcon
        self.trailingIcon = trailingIcon
        self.onSubmit = onSubmit
        self._value = value
        self._dateValue = dateValue
        self.dropdownItems = dropdownItems
        self.externalState = state
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
        
        switch textFieldType {
        case .primary:
            PrimaryTextFieldView(
                placeholder: placeholder,
                helperText: helperText,
                leadingIcon: leadingIcon,
                trailingIcon: trailingIcon,
                value: $value,
                focused: $focused,
                externalState: externalState,
                trailingAction: trailingAction,
                onSubmit: onSubmit
            )

        case .password:
            PasswordTextFieldView(
                placeholder: placeholder,
                helperText: helperText,
                leadingIcon: leadingIcon,
                value: $value,
                focused: $focused,
                externalState: externalState,
                onSubmit: onSubmit
            )
        case .search:
            SearchTextFieldView(
                placeholder: placeholder,
                value: $value,
                isEditing: Binding<Bool>(
                    get: { isEditing ?? false },
                    set: { isEditing = $0 }
                ),
                onSubmit: onSubmit
            )
        case .date:
            DateTextFieldView(
                placeholder: placeholder,
                helperText: helperText,
                leadingIcon: leadingIcon,
                value: $value,
                dateValue: $dateValue,
                focused: $focused,
                externalState: externalState
            )
        case .dropdown:
            DropdownTextFieldView(
                placeholder: placeholder,
                helperText: helperText,
                leadingIcon: leadingIcon,
                value: $value,
                focused: $focused,
                externalState: externalState,
                dropdownItems: dropdownItems,
                onSubmit: onSubmit
            )
        }
    }
}
