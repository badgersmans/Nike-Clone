//
//  ButtonView.swift
//  Nike Clone
//
//  Created by Shawn Law on 27/12/2024.
//

import SwiftUI

struct ButtonView: View {
    var label: String
    var imageName: String? = nil
    var isFilled: Bool = false
    var fillColor: Color = .black
    var textColor: Color = .black
    var borderColor: Color = .gray
    
    var body: some View {
        Button {
            // Button action goes here
        } label: {
            HStack {
                Text(label)
                    .fontWeight(.semibold)
                    .foregroundStyle(isFilled ? .white : textColor)
                if let imageName = imageName {
                    Image(systemName: imageName)
                        .foregroundStyle(isFilled ? .white : textColor)
                }
            }
            .capsuleButtonStyle(textColor: textColor, borderColor: borderColor, fillColor: fillColor, isFilled: isFilled)
        }
    }
}
