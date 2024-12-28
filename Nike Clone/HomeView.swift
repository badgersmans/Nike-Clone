//
//  ContentView.swift
//  Nike Clone
//
//  Created by Shawn Law on 22/12/2024.
//

import SwiftUI

struct HomeView: View {
    
    @State private var isReviewsVisible = false
    
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
                .padding() //vstack padding
                
                
                ButtonView(label: "Select Size", imageName: "chevron.down", isFilled: false)
                ButtonView(label: "Add to Bag", isFilled: true)
                ButtonView(label: "Favorite", imageName: "heart", isFilled: false)
                
                VStack {
                    Text("This product is excluded from all promotions and \ndiscounts.")
                        .font(.system(size: 16))
                        .foregroundStyle(.gray)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                }
                .padding(.vertical, 50)
                
                // product details
                VStack(alignment: .leading, spacing: 20) {
                    Text("Let's cut to the chase-the AJ11 is all-time. MJ won 72 games and a title while wearing 'em. Now, the icon returns in classic colours. From its slick patent leather mudguard to the frosted outsole, this Tinker Hatfield design brings the off-court allure. And for the final touch? Full-length Air cushioning is the cherry on top (er, bottom).")
                        .lineSpacing(7)
                        .font(.callout)
                    
                    Text(
                        """
                        • Shown: White/Black/Legend Blue
                        • Style: CT8012-104
                        • Country/Region of Origin: China
                        """
                    )
                    .lineSpacing(7)
                    .font(.callout)
                    
                    Button {
                        
                    } label: {
                        Text("View Product Details")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .background(
                                GeometryReader { geometry in
                                    Rectangle()
                                        .fill(Color.black)
                                        .frame(width: geometry.size.width, height: 2)
                                        .offset(y: geometry.size.height + 4) // Position the underline below the text
                                }
                            )
                    }
                }
                .padding()
                
                Divider()
                    .padding()
                    .padding(.vertical, 10)
                
                HStack { // size & fit section
                    Button {
                        
                    } label: {
                        Text("Size & Fit")
                            .font(.title3)
                            .fontWeight(.semibold)
                        Spacer()
                        Image(systemName: "chevron.down")
                    }
                    
                }
                .padding()
                .foregroundStyle(.black)
                
                Divider()
                    .padding()
                    .padding(.vertical, 8)
                
                HStack { // reviews section
                    Button {
                        withAnimation(.easeInOut(duration: 0.4)) {
                            isReviewsVisible.toggle()
                        }
                    } label: {
                        Text("Reviews (640)")
                            .font(.title3)
                            .fontWeight(.semibold)
                        Spacer()
                        Group {
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                        }
                        .imageScale(.small)
                        
                        Image(systemName: "chevron.down")
                            .rotationEffect(.degrees(isReviewsVisible ? 180 : 0)) // Rotate smoothly
                            .animation(.easeInOut(duration: 0.4), value: isReviewsVisible)
                    }
                    
                }
                .padding()
                .foregroundStyle(.black)
                
                if isReviewsVisible {
                    // reviews section
                    VStack(alignment: .leading, spacing: 8) { // review header (title, stars, username, date
                        Text("Love 11s") // title
                            .fontWeight(.semibold)
                        
                        HStack(spacing: 3) { // review stars
                            Group {
                                Image(systemName: "star.fill")
                                Image(systemName: "star.fill")
                                Image(systemName: "star.fill")
                                Image(systemName: "star.fill")
                                Image(systemName: "star.fill")
                            }
                            .imageScale(.small)
                        }
                        Text("Tomeka0710 · Dec 14, 2024")
                            .foregroundStyle(Color(.systemGray))
                        
                        VStack {
                            Text("The fit is perfect, and they’re very lightweight. Took off one star because the shipping took a bit longer than expected.bit longer than expebit longer than expected.cted.")
                                .lineLimit(3)
                                .lineSpacing(6)
                        }
                        .padding(.vertical, 18)
                    }
                    .padding()
                }
                
                Divider()
                    .padding()
                    .padding(.vertical, 8)
                
                
                
                
                
            }
        }
    }
}

#Preview {
    NavigationStack {
        HomeView()
    }
}
