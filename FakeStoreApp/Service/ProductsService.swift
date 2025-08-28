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

class ProductsService: ProductsServiceProtocol{
   
    private var downloder :HttpDataDownloderProtocol
    init(downloder:HttpDataDownloderProtocol = HTTPDataDownloder(endpoint: .products,cache:fileCacheManager(filename: "products.json"))){
        self.downloder = downloder
       
}
    func fetchproducts()async throws  -> [Products]{
        try await Task.sleep(for: .seconds(1))
        let products = try await downloder.fetchdata(as: Products.self)
        return products
    }
 
}
