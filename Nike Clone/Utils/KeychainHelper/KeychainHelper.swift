//
//  KeychainHelper.swift
//  Nike Clone
//
//  Created by Shawn Law on 31/12/2024.
//

import Foundation
import Security

class KeychainHelper {

    static let shared = KeychainHelper()

    // Save JWT token to Keychain
    func saveJWTToken(_ token: String) -> Bool {
        guard let data = token.data(using: .utf8) else {
            return false
        }

        let query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: "auth_token",  // You can adjust the key if needed
            kSecValueData: data
        ]

        // Delete any existing item with the same key
        SecItemDelete(query as CFDictionary)
        
        // Add new item to the Keychain
        let status = SecItemAdd(query as CFDictionary, nil)
        
        return status == errSecSuccess
    }
    
    // Function to get the JWT token
    func getJWTToken() -> String? {
        let query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: "auth_token",
            kSecReturnData: kCFBooleanTrue as Any,
            kSecMatchLimit: kSecMatchLimitOne
        ]
        
        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)
        
        // Check if we found the token
        if status == errSecSuccess, let data = result as? Data,
           let token = String(data: data, encoding: .utf8) {
            return token
        } else {
            return nil  // Return nil if no token is found or an error occurs
        }
    }
    
    // Function to delete the JWT token
    func deleteJWTToken() -> Bool {
        let query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: "auth_token"
        ]
        
        // Delete the token
        let status = SecItemDelete(query as CFDictionary)
        
        // Return true if the deletion was successful
        return status == errSecSuccess
    }
}
