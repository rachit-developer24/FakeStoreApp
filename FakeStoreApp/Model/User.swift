//
//  User.swift
//  FakeStoreApp
//
//  Created by Rachit Sharma on 10/08/2025.
//

import Foundation
struct User: Codable,Hashable,Identifiable {
    let id: Int
    var username: String
    var email: String
    var password: String
}
