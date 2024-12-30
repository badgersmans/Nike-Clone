//
//  Color+Extensions.swift
//  Nike Clone
//
//  Created by Shawn Law on 30/12/2024.
//

import SwiftUI

extension Color {
    static var random: Color {
        let randomRed = Double.random(in: 0...1)
        let randomGreen = Double.random(in: 0...1)
        let randomBlue = Double.random(in: 0...1)
        return Color(red: randomRed, green: randomGreen, blue: randomBlue)
    }
}
