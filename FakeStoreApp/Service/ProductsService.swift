//
//  ProductsService.swift
//  FakeStoreApp
//
//  Created by Rachit Sharma on 11/08/2025.
//

import Foundation
protocol ProductsServiceProtocol {
    func fetchproducts()async throws  -> [Products]
}


class ProductsService: ProductsServiceProtocol {
    func fetchproducts()async throws  -> [Products]{
        let urlstring = "https://fakestoreapi.com/products"
        guard let url = URL(string: urlstring)else{
            throw ApiError.invalidurl
        }
      
        let (data,response) = try await URLSession.shared.data(from: url)
        try responsehandler(response: response)
        do {
            try await Task.sleep(for: .seconds(2))
            let products = try JSONDecoder().decode( [Products].self, from: data)
            return products
        }catch {
            print(error)
            return []
        }

    }
    
    private func responsehandler(response:URLResponse)throws{
        guard let response = response as? HTTPURLResponse else {
            throw ApiError.invalidResponse
        }
        guard response.statusCode == 200 else {
            throw ApiError.invalidResponse
        }
    }
}
