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
                            .imageScale(.large)
                    }
                    
                }
                .padding()
                .foregroundStyle(.black)
                
                Divider()
                    .padding()
                    .padding(.vertical, 8)
                
                HStack { // reviews button
                    Button {
                        withAnimation(.easeInOut(duration: 0.4)) {
                            isReviewsVisible.toggle()
                        }
                    } label: {
                        Text("Reviews (640)")
                            .font(.title3)
                            .fontWeight(.semibold)
                        Spacer()
                        HStack(spacing: 4) {
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                        }
                        .imageScale(.small)
                        
                        // Chevron icon that rotates up-down
                        Image(systemName: "chevron.down")
                            .rotation3DEffect(
                                .degrees(isReviewsVisible ? 180 : 0),
                                axis: (x: 1, y: 0, z: 0), // Define the rotation axis (X-axis)
                                perspective: 0.5 // Apply some perspective to make it look more natural
                            )
                            .imageScale(.large)
                            .animation(.easeInOut(duration: 0.4), value: isReviewsVisible)
                    }
                    .buttonStyle(.plain)
                    
                } // end reviews button
                .padding()
                .foregroundStyle(.black)
                
                // reviews section
                if isReviewsVisible {
                    VStack(alignment: .leading, spacing: 8) { // review header (title, stars, username, date
                        Text("Love 11s") // title
                            .fontWeight(.semibold)
                        
                        HStack(spacing: 4) { // review stars
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
                
                // suggestions section
                VStack(alignment: .leading) {
                    Text("You Might Also Like")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .padding(.bottom, 20)
                    ScrollView(.horizontal, showsIndicators: false) {
                        VStack(alignment: .leading) {
                            Image("airJordan11Retro1")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 280, height: 280)
                                .clipShape(
                                    RoundedRectangle(cornerRadius: 10)
                                )
                            
                            Text("Air Jordan 3 Retro 'Black Cement'")
                                .lineLimit(nil)
                                .fixedSize(horizontal: false, vertical: true)
                                .frame(maxWidth: 280, alignment: .leading)
                            //                                .font(.caption2)
                                .fontWeight(.semibold)
                                .padding(.bottom, 3)
                            //                                .background(.red)
                            
                            Text("Men's Shoes")
                                .fontWeight(.semibold)
                                .foregroundColor(Color(.systemGray))
                            
                            Text((939 as NSNumber).currency)
                                .fontWeight(.semibold)
                                .padding(.top, 10)

                        }
                    }
                } // vstack padding
                .padding()
                
                
                
                
                
            }
        }
    }
}

#Preview {
    NavigationStack {
        HomeView()
    }
}
