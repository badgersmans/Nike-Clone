//
//  Shoe.swift
//  E Commerce
//
//  Created by Shawn Law on 31/12/2024.
//

import Foundation

struct Shoe: Identifiable, Codable {
    let id: String
    let name: String
    let category: String
    let price: Int
    let colors: [ColorOption]
    let description: String
    let originCountry: [String]
    let productDetails: ProductDetails
    let freeDeliveryAndReturns: DeliveryInfo
    let discount: Discount?
    let availableSizes: [SizeOption]
}

struct ColorOption: Codable {
    let name: String
    let images: [String]
    let sizes: [SizeOption]
    let isDefault: Bool
    let id: String
}

struct SizeOption: Codable {
    let size: String
    let availability: Bool
    let id: String
}

struct ProductDetails: Codable {
    let tagline: String?
    let benefits: [String]
    let productDetails: [String]
    let id: String
}

struct DeliveryInfo: Codable {
    let text: String
    let id: String
}


struct ShoeData: Codable {
    let shoes: [Shoe]
    let pagination: Pagination
}

struct Discount: Codable {
    var percentage: Int?
    var validUntil: String?
    var isExcluded: Bool?
    var id: String?
}

struct Pagination: Codable {
    var currentPage: Int
    var totalPages: Int
    var totalProducts: Int
    var limit: Int
}

let mockShoeData = ShoeData(
    shoes: [
        Shoe(
            id: "shoe123",
            name: "Sporty Sneakers",
            category: "Footwear",
            price: 120,
            colors: [
                ColorOption(
                    name: "White",
                    images: [
                        "https://raw.githubusercontent.com/badgersmans/nikeclone-backend-assets/main/assets/Shoes/Air%20Jordan%2011%20Retro%20'Legend%20Blue'/1.png",
                        "https://raw.githubusercontent.com/badgersmans/nikeclone-backend-assets/main/assets/Shoes/Air%20Jordan%2011%20Retro%20'Legend%20Blue'/2.png",
                        "https://raw.githubusercontent.com/badgersmans/nikeclone-backend-assets/main/assets/Shoes/Air%20Jordan%2011%20Retro%20'Legend%20Blue'/3.png",
                        "https://raw.githubusercontent.com/badgersmans/nikeclone-backend-assets/main/assets/Shoes/Air%20Jordan%2011%20Retro%20'Legend%20Blue'/4.png",
                        "https://raw.githubusercontent.com/badgersmans/nikeclone-backend-assets/main/assets/Shoes/Air%20Jordan%2011%20Retro%20'Legend%20Blue'/5.png",
                        "https://raw.githubusercontent.com/badgersmans/nikeclone-backend-assets/main/assets/Shoes/Air%20Jordan%2011%20Retro%20'Legend%20Blue'/6.png",
                        "https://raw.githubusercontent.com/badgersmans/nikeclone-backend-assets/main/assets/Shoes/Air%20Jordan%2011%20Retro%20'Legend%20Blue'/7.png",
                        "https://raw.githubusercontent.com/badgersmans/nikeclone-backend-assets/main/assets/Shoes/Air%20Jordan%2011%20Retro%20'Legend%20Blue'/8.png",
                        "https://raw.githubusercontent.com/badgersmans/nikeclone-backend-assets/main/assets/Shoes/Air%20Jordan%2011%20Retro%20'Legend%20Blue'/9.png",
                        "https://raw.githack.com/badgersmans/nikeclone-backend-assets/main/assets/Shoes/Air%20Jordan%2011%20Retro%20'Legend%20Blue'/video.mp4",
                    ],
                    sizes: [
                        SizeOption(size: "8", availability: true, id: "size8"),
                        SizeOption(size: "9", availability: true, id: "size9")
                    ],
                    isDefault: true,
                    id: "color1"
                ),
            ],
            description: "Let's cut to the chase—the AJ11 is all-time. MJ won 72 games and a title while wearing 'em. Now, the icon returns in classic colours. From its slick patent leather mudguard to the frosted outsole, this Tinker Hatfield design brings the off-court allure. And for the final touch? Full-length Air cushioning is the cherry on top (er, bottom).",
            originCountry: ["USA", "Vietnam"],
            productDetails: ProductDetails(
                tagline: "Comfort Meets Style",
                benefits: [
                    "Full-length Air-Sole unit delivers lightweight cushioning.",
                    "Contoured mudguard wraps the entire shoe, providing durability with sleek distinction.",
                    "Lightweight carbon fibre component provides stability.",
                ],
                productDetails: [
                    "Sculpted foam midsole",
                    "Rubber outsole",
                    "Padded tongue and collar",
                    "Round laces",
                    "Colour Shown: White/Black/Legend Blue",
                    "Style: CT8012-104",
                ],
                id: "product123"
            ),
            freeDeliveryAndReturns: DeliveryInfo(
                text: """
                Your order of RM 400 or more gets free standard delivery.
                
                Standard delivered 2-6 Business Days
                Express delivered 2-4 Business Days
                
                Orders are processed and delivered Monday-Friday (excluding public holidays)
                
                Nike Members enjoy free returns. Exclusions apply.
                """,
                id: "delivery123"
            ),
            discount: Discount(
                isExcluded: true
            ),
            availableSizes: [
                SizeOption(size: "UK 8", availability: true, id: "size8"),
                SizeOption(size: "UK 9", availability: false, id: "size9"),
                SizeOption(size: "UK 10", availability: true, id: "size10")
            ]
        )
    ],
    pagination: Pagination(
        currentPage: 1,
        totalPages: 5,
        totalProducts: 25,
        limit: 5
    )
)
