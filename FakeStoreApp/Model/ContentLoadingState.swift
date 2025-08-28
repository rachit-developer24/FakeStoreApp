//
//  ContantLoadingState.swift
//  FakeStoreApp
//
//  Created by Rachit Sharma on 12/08/2025.
//

import Foundation
enum ContentLoadingState<T:Decodable>{
    case isloading
    case empty
    case error(error : Error)
    case completed(Data : [T])
}


 
