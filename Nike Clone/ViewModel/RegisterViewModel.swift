//
//  RegisterViewModel.swift
//  Nike Clone
//
//  Created by Shawn Law on 29/12/2024.
//

import Foundation

@Observable class RegisterViewModel {
    
    // Validation states
    var emailValidationState: ValidationState?
    var passwordValidationState: ValidationState?
    var firstNameValidationState: ValidationState?
    
    var isValidLogin: Bool = false
    var isValidRegister: Bool = false
    var confirmPw = ""
    var birthYear: Int = Calendar.current.dateComponents([.year], from: Date()).year!
    
    var emailErrorMessage: String = ""
    var passwordErrorMessage: String = ""
    var nameErrorMessage: String = ""

    
    // MARK: - Validator Functions
    //    func passwordsMatch() -> Bool {
    //        password == confirmPw
    //    }
    
    // Validate if the string is a valid name
    //    var isValidFullName: Bool {
    //        let nameRegex = "^[A-Za-zÀ-ÖØ-öø-ÿ' \\-]{2,100}$"
    //        let predicate = NSPredicate(format: "SELF MATCHES %@", nameRegex)
    //        return predicate.evaluate(with: self)
    //    }
    
    var email = "" {
        didSet {
                if email.isEmpty {
                    emailValidationState = .empty
                    emailErrorMessage = ValidationMessages.emailRequired
                } else if email.isEmailValid {
                    emailValidationState = .valid
                    emailErrorMessage = ""
                } else {
                    emailValidationState = .invalid
                    emailErrorMessage = ValidationMessages.emailInvalid
                }

            updateValidRegister()
        }
    }

    var password = "" {
        didSet {
                if password.isEmpty {
                    passwordValidationState = .empty
                    passwordErrorMessage = ValidationMessages.passwordRequired
                } else if password.isPasswordValid {
                    passwordValidationState = .valid
                    passwordErrorMessage = ""
                } else {
                    passwordValidationState = .invalid
                    passwordErrorMessage = ValidationMessages.passwordInvalid
                }

            updateValidRegister()
        }
    }
    
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
    

    
    // Normalize the string using precomposed string with canonical mapping
    //    var normalizedName: String {
    //        return self.precomposedStringWithCanonicalMapping
    //    }
    
    // A combined method that normalizes the string and validates it
    //    var validatedNormalizedName: String? {
    //        let normalized = self.normalizedName
    //        return normalized.isValidName ? normalized : nil
    //    }
    
    // Computed error messages
//    var emailErrorMessage: String? {
//        switch emailValidationState {
//        case .invalid:
//            print("Email is invalid.")  // Debugging print
//            return ValidationMessages.emailInvalid
//        case .empty:
//            print("Email is empty.")  // Debugging print
//            return ValidationMessages.emailRequired
//        default:
//            return nil
//        }
//    }
    
//    var passwordErrorMessage: String? {
//        switch passwordValidationState {
//        case .invalid:
//            print("Password is invalid.")  // Debugging print
//
//            return ValidationMessages.passwordInvalid
//        case .empty:
//            print("Password is empty.")  // Debugging print
//
//            return ValidationMessages.passwordRequired
//        default:
//            return nil
//        }
//    }
//
    
    func canFinalizeRegistration() -> Bool {
        return emailValidationState == .valid && passwordValidationState == .valid
    }
    
    func updateValidRegister() {
        isValidRegister = emailValidationState == .valid && passwordValidationState == .valid
    }
    
    //    func isValidAge() -> Bool {
    //        (Calendar.current.dateComponents([.year], from: Date()).year! - birthYear) >= 21
    //    }
    
    
    
    //    var confirmPwPrompt: String {
    //        if passwordsMatch() {
    //            return ""
    //        } else {
    //            return "Password fields do not match"
    //        }
    //    }
    
    
}
