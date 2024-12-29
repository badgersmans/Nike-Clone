//
//  ValidationState.swift
//  Nike Clone
//
//  Created by Shawn Law on 29/12/2024.
//

enum ValidationState {
    case valid
    case invalid
    case empty
}

enum ValidationMessages {
    static let emailRequired = "Email is required"
    static let emailInvalid = "Email is invalid"
    static let passwordRequired = "Password is required"
    static let passwordInvalid = "Password must be 8-72 characters with at least one uppercase, lowercase, number, and symbol"
}
