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
extension User{
    static var MockUser:[User] = [
        User(id: 1, username: "Rachit", email: "Rachit@gmail.com", password: "12345"),
        User(id: 2, username: "Devashish", email: "Devashish@gmail.com", password: "22334"),
        User(id: 3, username: "Shubham", email: "Shubham@gmail.com", password: "33445"),
        User(id: 4, username: "Amit", email: "Amit@gmail.com", password: "44556"),
        User(id: 5, username: "Rohit", email: "Rohit@gmail.com", password: "55667"),
        User(id: 6, username: "Vishal", email: "Vishal@gmail.com", password: "66778"),
        User(id: 7, username: "Sagar", email: "Sagar@gmail.com", password: "77889"),
        User(id: 8, username: "Prateek", email: "Prateek@gmail.com", password: "88445")
    ]
}
