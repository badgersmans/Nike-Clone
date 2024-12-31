//
//  ShoeViewModel.swift
//  Nike Clone
//
//  Created by Shawn Law on 31/12/2024.
//

import Foundation

@Observable @MainActor
class ShoeViewModel {
    var shoes: [Shoe] = []
    var errorMessage: String? = nil
    var isLoading: Bool = false
    let baseURL = "http://localhost:4000/"
    

    // Fetch shoes from the API
    func fetchShoes(page: Int) async throws {
        guard let url = URL(string: "\(baseURL)/shoes?page=\(page)") else {
            throw NetworkError.invalidURL
        }
        
        isLoading = true
        
        do {
            // Make the request and get the data
            let shoesData: ShoeData = try await getRequest(url: url)
            
            // Update the shoes array with the fetched data
            DispatchQueue.main.async {
                self.shoes = shoesData.shoes
                self.isLoading = false
            }
            
        } catch {
            DispatchQueue.main.async {
                self.errorMessage = "Failed to fetch shoes data: \(error)"
                self.isLoading = false
            }
        }
        
    }
