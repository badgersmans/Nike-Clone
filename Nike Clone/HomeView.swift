//
//  ContentView.swift
//  Nike Clone
//
//  Created by Shawn Law on 22/12/2024.
//

import SwiftUI

struct HomeView: View {
    
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                Text("Air Jordan 11 Retro 'Legend Blue'")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                
                ImageCarousellView(shoe: mockShoe)
                Spacer()
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Air Jordan 11 Retro 'Legend Blue'")
                        .font(.title3)
                        .bold()
                    Text("Men's Shoes")
                    
                    VStack {
                        Text("RM 969")
                            .bold()
                    }
                    .padding(.top, 8)
                    
                }
                .padding()
                
                Button {
                    
                } label: {
                    HStack {
                        Text("Select Size")
                            .foregroundStyle(.black)
                            .fontWeight(.semibold)
                        Image(systemName: "chevron.down")
                            .foregroundStyle(.black)
                        
                    }
                    .capsuleButtonStyle() // Black-filled button

                }
                Button {
                    
                } label: {
                    HStack {
                        Text("Add to Bag")
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)
                        
                        
                    }
                    .capsuleButtonStyle(fillColor: .black, isFilled: true)
                }
                
                Button {
                    
                } label: {
                    HStack {
                        Text("Favorite")
                            .foregroundStyle(.black)
                            .fontWeight(.semibold)
                        Image(systemName: "heart")
                            .foregroundStyle(.black)
                        
                    }
                    .capsuleButtonStyle() // Black-filled button

                }
                
                
            }
        }
    }
}

#Preview {
    HomeView()
}
