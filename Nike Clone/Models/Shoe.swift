//
//  Shoe.swift
//  Nike Clone
//
//  Created by Shawn Law on 22/12/2024.
//

import Foundation

struct Shoe: Identifiable {
    let id: UUID = UUID()
    let name: String
    let description: String
    let price: Double
    let images: [String]
    let video: String?
}


let mockShoe: Shoe = Shoe(
    name: "Running Shoes",
    description: "Comfortable running shoes for all terrains.",
    price: 89.99,
    images: [
        "airJordan11Retro1",
        "airJordan11Retro2",
        "airJordan11Retro3",
        "airJordan11Retro4",
        "airJordan11Retro5",
        "airJordan11Retro6",
        "airJordan11Retro7",
        "airJordan11Retro8",
        "airJordan11Retro9",
    ],
    video: "airJordan11RetroVideo"
)
