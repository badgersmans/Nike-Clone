//
//  ProductItemView.swift
//  Nike Clone
//
//  Created by Shawn Law on 30/12/2024.
//

import SwiftUI

struct ProductItemView: View {

    @State private var isFavorite: Bool = false
    let imageHeight: CGFloat = 250

    var body: some View {
        VStack(alignment: .leading) {
            // image with favorite button
            ZStack(alignment: .topTrailing) {
                Image("airJordan11Retro1")
                    .resizable()
                    .scaledToFill()
                    .frame(height: imageHeight)
                    .clipped()
                
                Button {
                    isFavorite.toggle()
                } label: {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 33, height: 33)
                        .overlay(
                            Image(systemName: isFavorite ? "heart.fill" : "heart")
                                .imageScale(.large)
                                .foregroundColor(.black)
                                .font(Font.system(size: 15, weight: .semibold))
                            
                        )
                        .padding() // Positive padding to move the circle towards the edge
                        .foregroundStyle(.black)
                }
            } // end zstack
            
            // Title, category, price
            VStack(alignment: .leading, spacing: 5) {
                Text("Nike Alphafly 3")
                    .fontWeight(.semibold)
                Text("Men's Road Racing Shoes")
                    .font(.system(size: 15))
                    .foregroundStyle(Color(.systemGray))
                    .fontWeight(.semibold)
                Text(1209.currency)
                    .fontWeight(.semibold)
            }
            .padding(.leading, 5)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            // Shoe Color picker
            HStack(spacing: 12) {
                ForEach(0..<3, id: \.self) { index in
                    Button {
                        
                    } label: {
                        Circle()
                            .stroke(.gray, lineWidth: 3)
                            .fill(Color.random)
                            .frame(width: 13)
                    }
                }
            }
            .padding(.leading, 5)
            .padding(.top, 13)
        } // end parent vstack
    }
}

#Preview {
    ProductItemView()
}
