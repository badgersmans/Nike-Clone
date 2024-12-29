//
//  RegisterViewModel.swift
//  Nike Clone
//
//  Created by Shawn Law on 29/12/2024.
//

import Foundation

@Observable
class RegisterViewModel {
    var confirmPw = ""
    var birthYear: Int = Calendar.current.dateComponents([.year], from: Date()).year!
    
    // Validation States
    var emailValidationState: ValidationState = .empty
    var passwordValidationState: ValidationState = .empty
    var firstNameValidationState: ValidationState = .empty
    
    // MARK: - Validator Functions
    func passwordsMatch() -> Bool {
        password == confirmPw
    }
    
    
    
    // Validate if the string is a valid name
    //    var isValidFullName: Bool {
    //        let nameRegex = "^[A-Za-zÀ-ÖØ-öø-ÿ' \\-]{2,100}$"
    //        let predicate = NSPredicate(format: "SELF MATCHES %@", nameRegex)
    //        return predicate.evaluate(with: self)
    //    }
    
    var isFirstNameValid: Bool {
        let firstNameRegex = "^[A-Za-zÀ-ÖØ-öø-ÿ' \\-]{2,50}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", firstNameRegex)
        return predicate.evaluate(with: self)
    }
    
    var isLastNameValid: Bool {
        let lastNameRegex = "^[A-Za-zÀ-ÖØ-öø-ÿ' \\-]{2,50}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", lastNameRegex)
        return predicate.evaluate(with: self)
    }
    
    private func validateEmail() {
        validateInput(
            input: email,
            isValid: { $0.isEmailValid },
            emptyMessage: ValidationMessages.emailRequired,
            invalidMessage: ValidationMessages.emailInvalid,
            state: &emailValidationState,
            errorMessage: &emailErrorMessage
        )
    }

    private func validatePassword() {
        validateInput(
            input: password,
            isValid: { $0.isPasswordValid },
            emptyMessage: ValidationMessages.passwordRequired,
            invalidMessage: ValidationMessages.passwordInvalid,
            state: &passwordValidationState,
            errorMessage: &passwordErrorMessage
        )
    }
    
    private func validateInput(
        input: String,
        isValid: (String) -> Bool,
        emptyMessage: String,
        invalidMessage: String,
        state: inout ValidationState,
        errorMessage: inout String
    ) {
        if input.isEmpty {
            updateValidationState(state: &state, errorMessage: &errorMessage, stateValue: .empty, message: emptyMessage)
        } else if isValid(input) {
            updateValidationState(state: &state, errorMessage: &errorMessage, stateValue: .valid, message: "")
        } else {
            updateValidationState(state: &state, errorMessage: &errorMessage, stateValue: .invalid, message: invalidMessage)
        }
    }
    
    private func updateValidationState(
        state: inout ValidationState,
        errorMessage: inout String,
        stateValue: ValidationState,
        message: String
    ) {
        state = stateValue
        errorMessage = message
    }
    
    
    // Normalize the string using precomposed string with canonical mapping
    //    var normalizedName: String {
    //        return self.precomposedStringWithCanonicalMapping
    //    }
    
    // A combined method that normalizes the string and validates it
    //    var validatedNormalizedName: String? {
    //        let normalized = self.normalizedName
    //        return normalized.isValidName ? normalized : nil
    //    }
    
    
    
    
    func canFinalizeRegistration() -> Bool {
        return emailValidationState == .valid && passwordValidationState == .valid
    }
    
    //    func isValidAge() -> Bool {
    //        (Calendar.current.dateComponents([.year], from: Date()).year! - birthYear) >= 21
    //    }
    
    
    
    // MARK: - Validation Strings
    var emailErrorMessage: String = ""
    var passwordErrorMessage: String = ""
    
    //    var email = "" {
    //        didSet {
    //            if email.isEmpty {
    //                emailValidationState = .empty
    //                emailErrorMessage = "Email is required"
    //            } else if email.isEmailValid {
    //                emailValidationState = .valid
    //                emailErrorMessage = ""
    //            } else {
    //                emailValidationState = .invalid
    //                emailErrorMessage = "Invalid email format"
    //            }
    //
    //            finalizeRegistration()
    //        }
    //    }
    //
    //    var password = "" {
    //        didSet {
    //            if password.isEmpty {
    //                passwordValidationState = .empty
    //                passwordErrorMessage = "Password is required"
    //            } else if password.isPasswordValid {
    //                passwordValidationState = .valid
    //                passwordErrorMessage = ""
    //            } else {
    //                passwordValidationState = .invalid
    //                passwordErrorMessage = "Password must be 8-72 characters with at least one uppercase, lowercase, number, and symbol"
    //            }
    //
    //            finalizeRegistration()
    //        }
    //    }
    
    var email = "" {
        didSet {
            validateEmail()
        }
    }

    var password = "" {
        didSet {
            validatePassword()
        }
    }
    
    
    
    //    var confirmPwPrompt: String {
    //        if passwordsMatch() {
    //            return ""
    //        } else {
    //            return "Password fields do not match"
    //        }
    //    }
    
    
}
