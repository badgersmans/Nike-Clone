//
//  NumberListViewModel.swift
//  Nike Clone
//
//  Created by Shawn Law on 30/12/2024.
//

import SwiftUI

@Observable class NumberListViewModel {
    
    var numbers: [Int] = []
    
    func populateData(page: Int) {
        
        guard let url = URL(string: "https://island-bramble.glitch.me/data?page=\(page)") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            let numbers = try? JSONDecoder().decode([Int].self, from: data)
            DispatchQueue.main.async { [weak self] in
                self?.numbers.append(contentsOf: numbers ?? [])
            }
        }.resume()
        
    }
    
    func shouldLoadData(id: Int) -> Bool {
        return id == numbers.count - 2
    }
}
