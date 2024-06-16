//
//  Input Validator.swift
//  
//
//  Created by Pranav Suri on 2024-06-15.
//

import Foundation

protocol Validator {
    func validate(input: String) -> (RDTextFieldStatus, String?)
}

struct EmailValidator: Validator {
    func validate(input: String) -> (RDTextFieldStatus, String?) {
        let emailRegex = "^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,}$"
        let emailPredicate = NSPredicate(format: "SELF MATCHES[c] %@", emailRegex)
        if emailPredicate.evaluate(with: input) {
            return (.success, nil)
        } else {
            return (.error, "Invalid email format")
        }
    }
}

struct PasswordValidator: Validator {
    func validate(input: String) -> (RDTextFieldStatus, String?) {
        if input.count >= 8 {
            return (.success, nil)
        } else {
            return (.error, "Password must be at least 8 characters long")
        }
    }
}

struct NumbersOnlyValidator: Validator {
    func validate(input: String) -> (RDTextFieldStatus, String?) {
        if input.allSatisfy({ $0.isNumber }) {
            return (.success, nil)
        } else {
            return (.error, "Only numbers are allowed")
        }
    }
}

public enum ValidationType {
    case email
    case password
    case numbersOnly
    
    var validator: Validator {
        switch self {
        case .email:
            return EmailValidator()
        case .password:
            return PasswordValidator()
        case .numbersOnly:
            return NumbersOnlyValidator()
        }
    }
}
