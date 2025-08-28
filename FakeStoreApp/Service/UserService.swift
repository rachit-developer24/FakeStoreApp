//
//  UserCache.swift
//  FakeStoreApp
//
//  Created by Rachit Sharma on 14/08/2025.
//

import Foundation
protocol UserServiceProtocol {
    func fetchusers()async throws  -> [User]
}
class UserService:UserServiceProtocol {
    private var downloder : HttpDataDownloderProtocol
    init(downloder:HttpDataDownloderProtocol = HTTPDataDownloder(endpoint: .users,cache: fileCacheManager(filename: "Users.json"))){
            self.downloder = downloder
        }
    func fetchusers()async throws  -> [User]{
        let users = try await downloder.fetchdata(as: User.self)
        return users
        }
    }


