//
//  ProductListView.swift
//  Nike Clone
//
//  Created by Shawn Law on 30/12/2024.
//

import SwiftUI

struct ProductListView: View {
    
    @State private var numberListVM = NumberListViewModel()
    @State private var currentPage: Int = 1
    @State private var triggerId: Int? = nil // Track the ID that triggers shouldLoadData
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: columns, spacing: 40) {
                    ForEach(0..<20, id: \.self) { index in
                        NavigationLink(destination: HomeView()) {
                            ProductItemView()
                        }
                        .buttonStyle(PlainButtonStyle())  // Disable the default link style
                    }
                } // end of LazyVGrid
            } // end of parent scrollview
        }
    }
}

#Preview {
    ProductListView()
}
