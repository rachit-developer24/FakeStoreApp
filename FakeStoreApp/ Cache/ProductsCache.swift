//
//  Cache.swift
//  FakeStoreApp
//
//  Created by Rachit Sharma on 12/08/2025.
//

import Foundation
struct ProductsCache{
    private let documentDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
    private let fileName = "products.json"
    func getProducts() throws -> [Products]?{
        guard let FileURL = documentDirectoryURL?.appending(path: fileName) else {
            return nil
        }
        guard FileManager.default.fileExists(atPath: FileURL.path) else {
            return nil
        }
        let data = try Data(contentsOf: FileURL)
        return try JSONDecoder().decode([Products].self, from: data)
       
    }
    func saveProducts(_ products: [Products]) throws {
        guard let FileURL = documentDirectoryURL?.appending(path: fileName) else {
            return
        }
        do{
           let data = try JSONEncoder().encode(products)
            try data.write(to: FileURL)
        }catch {
            print(error.localizedDescription)
        }
    }
    func invalidateCache(){
        guard let FileURL = documentDirectoryURL?.appending(path: fileName) else {
            return
        }
        do{
            try FileManager.default.removeItem(at: FileURL)
        }catch {
            print(error.localizedDescription)
        }
    }
}
