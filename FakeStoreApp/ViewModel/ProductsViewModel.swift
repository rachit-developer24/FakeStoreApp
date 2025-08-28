//
//  ProductsViewModel.swift
//  FakeStoreApp
//
//  Created by Rachit Sharma on 11/08/2025.
//

import Foundation
import Observation
@Observable
class ProductsViewModel {
    var products: [Products] = []
    var lodingState:ContentLoadingState<Products> = .isloading
    let Service : ProductsServiceProtocol
    init(Service:ProductsServiceProtocol){
        self.Service = Service
    }
    func fetchProducts()async {
        do{
            self.products = try await Service.fetchproducts()
            self.lodingState = products.isEmpty ? .empty : .completed(Data: products)
        }catch{
            self.lodingState = .error(error: error)
        }
        
        }
      
        
    }
    

