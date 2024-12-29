//
//  NumberFormatter+Extension.swift
//  MV Example
//
//  Created by Shawn Law on 22/12/2024.
//

import Foundation

extension NumberFormatter {
    
    static var currency: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }
}
