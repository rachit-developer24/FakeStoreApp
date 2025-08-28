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
    private let cache: fileCacheManager
    private var downloder : HttpDataDownloderProtocol
    init(downloder:HttpDataDownloderProtocol = HTTPDataDownloder(endpoint: .users)){
            self.downloder = downloder
        self.cache = fileCacheManager(filename: "Users.json")
        }
    func fetchusers()async throws  -> [User]{
        let users = try await downloder.fetchdata(as: User.self)

        return users
        }
    }


