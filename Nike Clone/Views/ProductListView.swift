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

    var body: some View {
        List(numberListVM.numbers, id: \.self) { number in
            Text("\(number)")
                .onAppear {
                    // When ScrollView arrives at the position `numbers.count - 2`
                    // increment currentPage, and load more data
                    if numberListVM.shouldLoadData(id: number) {
                        currentPage += 1
                        numberListVM.populateData(page: currentPage)
                    }
                }
        }
        .onAppear {
            // Call API when view appears with page num 1
            numberListVM.populateData(page: 1)
        }
    }
}

#Preview {
    ProductListView()
}
