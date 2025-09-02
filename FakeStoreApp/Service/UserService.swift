//
//  UserCache.swift
//  FakeStoreApp
//
//  Created by Rachit Sharma on 14/08/2025.
//

import Foundation
protocol UserServiceProtocol {
    func fetchUsers()async throws  -> [User]
    func refreshUsers() async throws ->[User]
}
class UserService:UserServiceProtocol {
    private var downloder : HttpDataDownloderProtocol
    init(downloder:HttpDataDownloderProtocol = HTTPDataDownloder(endpoint: .users,cache: fileCacheManager(filename: "Users.json"))){
            self.downloder = downloder
        }
    func fetchUsers()async throws  -> [User]{
        let users = try await downloder.fetchdata(as: User.self)
        return users
        }
    
    func refreshUsers() async throws ->[User] {
        let users = try await downloder.refreshdata(as: User.self)
        return users
    }
    
    
    }


