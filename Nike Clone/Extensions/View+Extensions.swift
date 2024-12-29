//
//  View+Extensions.swift
//  Nike Clone
//
//  Created by Shawn Law on 27/12/2024.
//

import SwiftUI


extension View {
    func capsuleButtonStyle(
        textColor: Color = .black,
        borderColor: Color = .gray,
        fillColor: Color = .black,
        isFilled: Bool = false
    ) -> some View {
        self.modifier(CapsuleButtonStyle(textColor: textColor, borderColor: borderColor, fillColor: fillColor, isFilled: isFilled))
    }
}
