//
//  ContentView.swift
//  Nike Clone
//
//  Created by Shawn Law on 22/12/2024.
//

import SwiftUI

struct HomeView: View {
    
    
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Air Jordan 11 Retro 'Legend Blue'")
                    .font(.headline)
                
                ImageCarousellView(shoe: mockShoe)
                Spacer()
                
            }
        }
    }
}

#Preview {
    HomeView()
}
