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
        private let cache = ProductsCache()
        private var lastfecthedtime:Date?
        private let refreshinterval:TimeInterval = 60 * 5
        private var downloder = httdataDownloder()
        init(downloder:httdataDownloder = httdataDownloder()){
            self.downloder = downloder
        }
    func fetchusers()async throws  -> [User]{
        
        let products = try await downloder.fetchdata(as: User.self, endpoint: .users)
            savelastfetchedtime()
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


