//
//  NSNumber+Extensions.swift
//  Nike Clone
//
//  Created by Shawn Law on 29/12/2024.
//

import SwiftUI

extension NSNumber {
    var currency: String {
        let formatter = NumberFormatter.currency
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        return formatter.string(from: self) ?? "$0"
    }
}
