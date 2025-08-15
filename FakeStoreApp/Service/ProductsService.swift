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
    private let cache = ProductsCache()
    private var lastfecthedtime:Date?
    private let refreshinterval:TimeInterval = 60 * 5
    private var downloder = httdataDownloder()
    init(downloder:httdataDownloder = httdataDownloder()){
        self.downloder = downloder
    }
    func fetchproducts()async throws  -> [Products]{
        if !needrefresh, let cachedData = try cache.getProducts(){
            return cachedData
        }
        let products = try await downloder.fetchdata(as: Products.self, endpoint: .products)
        savelastfetchedtime()
        try  cache.saveProducts(products)
        return products
        

    }
    private func savelastfetchedtime(){
        UserDefaults.standard.set(Data(), forKey: "lastfetchedtime")
    }
    private  func getlastfetchedtime(){
        self.lastfecthedtime = UserDefaults.standard.value(forKey:"lastfetchedtime" ) as? Date
    }
    private var needrefresh:Bool{
        guard let lastfecthedtime else{return true}
        return Date().timeIntervalSince(lastfecthedtime) >= refreshinterval
        
    }
}
