//
//  ButtonView.swift
//  Nike Clone
//
//  Created by Shawn Law on 27/12/2024.
//

import SwiftUI

struct CapsuleButton: View {
    var label: String
    var imageName: String? = nil
    var isFilled: Bool = true
    var fillColor: Color = .black
    var textColor: Color = .white
    var borderColor: Color = .black
    
    var body: some View {
        Button {
            // Button action goes here
        } label: {
            HStack {
                Text(label)
                    .fontWeight(.semibold)
                    .foregroundStyle(isFilled ? .white : textColor) // White text for filled, custom text color for bordered
                if let imageName = imageName {
                    Image(systemName: imageName)
                        .foregroundStyle(isFilled ? .white : textColor)
                }
            }
            .capsuleButtonStyle(textColor: textColor, fillColor: fillColor, isFilled: isFilled, borderColor: borderColor)
        }
    }
}
