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


