//
//  MockDataDependency.swift
//  FakeStoreApp
//
//  Created by Rachit Sharma on 11/08/2025.
//

import Foundation
class MockDataDependency: ProductsServiceProtocol{
    func refreshdata() async throws -> [Products] {
        return [Products(id: 1, title: "ram", price: 123.33, description: "hii bros", image: "Peace")]
    }
    
    func fetchproducts() async throws -> [Products] {
        return[ Products(id: 1, title: "ram", price: 123.66, description: "hamko ankh dikhata h madarjat", image: "https://picsum.photos/seed/helmet/200/200)")]
    }
    
    
}
