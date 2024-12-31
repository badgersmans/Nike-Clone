//
//  HttpClient.swift
//  Nike Clone
//
//  Created by Shawn Law on 31/12/2024.
//

import Foundation

class HttpClient {
    
    static let shared = HttpClient()
    
    private init() {}
    
    // Method to add the JWT token to the request headers
    private func attachJWTToken(to request: inout URLRequest) {
        if let jwtToken = KeychainHelper.shared.getJWTToken() {
            request.setValue("Bearer \(jwtToken)", forHTTPHeaderField: "Authorization")
        }
    }
    
    func postRequest<T: Decodable>(url: URL, body: Data) async throws -> T {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = body
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        attachJWTToken(to: &request) // Attach JWT token if available
        
        
        // Print the request URL and headers for debugging
        print("Request URL: \(url)")
        print("Request Headers: \(request.allHTTPHeaderFields ?? [:])")
        
        // Print the request body as a string (make sure it's valid JSON)
        if let bodyString = String(data: body, encoding: .utf8) {
            print("Request Body: \(bodyString)")
        } else {
            print("Request Body: Invalid JSON")
        }
        
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        print("Response Status Code: \(httpResponse.statusCode)")
        
        // If the response status code is in the range 200–299, we decode the success response
        if (200...299).contains(httpResponse.statusCode) {
            let decodedResponse = try JSONDecoder().decode(T.self, from: data)
            print("Decoded Response: \(decodedResponse)")
            
            return decodedResponse
        } else {
            // Handle the error response for failed status codes (like 400, 401, etc.)
            let errorResponse = try? JSONDecoder().decode(ErrorResponse.self, from: data)
            let errorMessage = errorResponse?.message ?? "Unknown error"
            print("Error Response: \(errorMessage)")  // Print the error message
            
            throw NetworkError.serverError(message: errorMessage)
        }
    }
    
    func getRequest<T: Decodable>(url: URL) async throws -> T {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        attachJWTToken(to: &request) // Attach JWT token if available
        
        // Print debug information
        print("Request URL: \(url)")
        print("Request Headers: \(request.allHTTPHeaderFields ?? [:])")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        print("Response Status Code: \(httpResponse.statusCode)")
        
        if (200...299).contains(httpResponse.statusCode) {
            let decodedResponse = try JSONDecoder().decode(T.self, from: data)
            print("Decoded Response: \(decodedResponse)")
            return decodedResponse
        } else {
            let errorResponse = try? JSONDecoder().decode(ErrorResponse.self, from: data)
            let errorMessage = errorResponse?.message ?? "Unknown error"
            print("Error Response: \(errorMessage)")
            throw NetworkError.serverError(message: errorMessage)
        }
    }
}

// Define a custom error enum
enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case invalidHTTPStatusCode
    case serverError(message: String) // New error case for server errors
    
}

struct ErrorResponse: Decodable {
    let message: String
}
