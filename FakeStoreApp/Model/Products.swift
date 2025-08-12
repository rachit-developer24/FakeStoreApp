//
//  Products.swift
//  FakeStoreApp
//
//  Created by Rachit Sharma on 10/08/2025.
//

import Foundation
struct Products:Codable,Identifiable{
    let id : Int
    var title : String
    var price : Double
    var description : String
    var image : String 
}

extension Products{
    static var Mockproducts:[Products] = [
        Products(
                id: 1,
                title: "Racing Helmet XR-1",
                price: 249.99,
                description: "Lightweight carbon fiber helmet with aerodynamic vents and anti-fog visor.",
                image: "https://picsum.photos/seed/helmet/200/200"
            ),
        Products(
                id: 2,
                title: "Track Gloves Pro",
                price: 79.50,
                description: "Fire-resistant gloves with reinforced palms and touchscreen fingertips.",
                image: "https://picsum.photos/seed/gloves/200/200"
            ),
        Products(
                id: 3,
                title: "Performance Racing Suit",
                price: 899.00,
                description: "Multi-layer FIA-compliant suit offering superior heat protection and mobility.",
                image: "https://picsum.photos/seed/suit/200/200"
            ),
        Products(
                id: 4,
                title: "Digital Telemetry Pod",
                price: 159.95,
                description: "Plug-and-play telemetry module for logging speed, RPM and lap times.",
                image: "https://picsum.photos/seed/telemetry/200/200"
            ),
        Products(
                id: 5,
                title: "Lightweight Steering Wheel",
                price: 349.00,
                description: "Quick-release aluminum wheel with programmable paddle shifters.",
                image: "https://picsum.photos/seed/wheel/200/200"
            ),
        Products(
                id: 6,
                title: "Racing Boots Sprint",
                price: 129.99,
                description: "Low-profile boots with anti-slip sole and ankle support for precision pedal control.",
                image: "https://picsum.photos/seed/boots/200/200"
            ),
        Products(
                id: 7,
                title: "Pit Crew Radio Set",
                price: 219.00,
                description: "Durable two-way radio set with noise cancellation and long-range comms.",
                image: "https://picsum.photos/seed/radio/200/200"
            ),
        Products(
                id: 8,
                title: "Carbon Brake Kit",
                price: 1299.00,
                description: "High-performance carbon ceramic brake set optimized for track use.",
                image: "https://picsum.photos/seed/brakes/200/200"
            ),
        Products(
                id: 9,
                title: "Racing Seat Bucket",
                price: 529.99,
                description: "Ergonomic bucket seat with multi-point harness compatibility and thermal padding.",
                image: "https://picsum.photos/seed/seat/200/200"
            ),
        Products(
                id: 10,
                title: "Helmet Camera 4K",
                price: 199.99,
                description: "Compact 4K action camera with image stabilization and helmet mount.",
                image: "https://picsum.photos/seed/cam/200/200"
            )
        ]

}
