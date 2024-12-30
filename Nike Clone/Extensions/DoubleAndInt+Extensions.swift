//
//  DoubleAndInt+Extensions.swift
//  Nike Clone
//
//  Created by Shawn Law on 30/12/2024.
//

import Foundation

// Extend Double for currency formatting
extension Double {
    var currency: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale.current // Uses the current locale for currency formatting
        formatter.maximumFractionDigits = 2 // Limit to two decimal places
        
        // Format the value normally
        let formattedString = formatter.string(from: NSNumber(value: self)) ?? "$0.00"
        
        // Remove the decimal part if it's .00
        if formattedString.hasSuffix(".00") {
            return String(formattedString.dropLast(3)) // Remove ".00" from the string
        }
        
        return formattedString
    }
}

// Extend Int for currency formatting
extension Int {
    var currency: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale.current // Uses the current locale for currency formatting
        formatter.maximumFractionDigits = 2 // Limit to two decimal places
        
        // Format the value normally
        let formattedString = formatter.string(from: NSNumber(value: self)) ?? "$0.00"
        
        // Remove the decimal part if it's .00
        if formattedString.hasSuffix(".00") {
            return String(formattedString.dropLast(3)) // Remove ".00" from the string
        }
        
        return formattedString
    }
}

