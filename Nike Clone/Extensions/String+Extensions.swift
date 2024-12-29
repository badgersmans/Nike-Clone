//
//  String+Extensions.swift
//  Nike Clone
//
//  Created by Shawn Law on 29/12/2024.
//

import Foundation

extension String {
    var isEmailValid: Bool {
        let emailRegex = "(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9]))\\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        
        
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: self)
    }

    var isPasswordValid: Bool {
        // Regex for password validation
        let passwordRegex = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{8,72}$"
        
        // Check if the string is empty or contains only whitespace
        guard !self.isEmptyOrWhitespace else { return false }
        
        // Check if the string matches the regex pattern
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: self)
    }

    var isEmptyOrWhitespace: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }


    // Validate if the string is a valid name
    var isNameValid: Bool {
        let nameRegex = "^[A-Za-zÀ-ÖØ-öø-ÿ' \\-]{2,50}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", nameRegex)
        return predicate.evaluate(with: self)
    }
    
    // Normalize the string using precomposed string with canonical mapping
    var normalizedName: String {
        return self.precomposedStringWithCanonicalMapping
    }
    
    // A combined method that normalizes the string and validates it
    var validatedNormalizedName: String? {
        let normalized = self.normalizedName
        return normalized.isNameValid ? normalized : nil
    }
    
    // Method to check if the string is a valid 6-digit verification code
    var isValidVerificationCode: Bool {
        // Check if the string contains exactly 6 digits
        let regex = "^[0-9]{6}$"
        let test = NSPredicate(format: "SELF MATCHES %@", regex)
        return test.evaluate(with: self)
    }
}
