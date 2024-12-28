//
//  ButtonStyle.swift
//  Nike Clone
//
//  Created by Shawn Law on 27/12/2024.
//

import SwiftUI

struct CapsuleButtonStyle: ViewModifier {
    var textColor: Color = .black
    var borderColor: Color = .gray
    var fillColor: Color = .black
    var isFilled: Bool = false

    func body(content: Content) -> some View {
        content
            .padding()
            .padding(.vertical, 8)
            .frame(maxWidth: .infinity) // Make the button as wide as the screen
            .background(
                Capsule()
                    .fill(isFilled ? fillColor : Color.clear) // Apply fill or clear based on isFilled
                    .overlay(
                        Capsule()
                            .stroke(borderColor.opacity(0.7), lineWidth: 1)
                    )
            )
            .foregroundColor(isFilled ? .white : textColor) // Set text color based on filled or bordered
            .padding(.horizontal)
            .padding(.vertical, 3)
    }
}

