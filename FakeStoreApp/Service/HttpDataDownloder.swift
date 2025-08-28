//
//  HttpDataDownloder.swift
//  FakeStoreApp
//
//  Created by Rachit Sharma on 15/08/2025.
//

import Foundation
protocol HttpDataDownloderProtocol{
    func fetchdata<T:Codable>(as type: T.Type  ) async throws -> [T]
}
class HTTPDataDownloder: HttpDataDownloderProtocol {
    private let baseurl = "https://fakestoreapi.com"
   private let cache:fileCacheManager?
    private let endpoint:FakeStoreEndPoints
    private var lastfecthedtime:Date?
    private let refreshinterval:TimeInterval = 60 * 10

    init(endpoint:FakeStoreEndPoints,cache:fileCacheManager? = nil) {
        self.cache = cache
        self.endpoint = endpoint
        getlastfetchedtime()
    }
    
    func fetchdata<T:Codable>(as type: T.Type) async throws -> [T] where T : Decodable {
        if !needrefresh, let cache{
            print("Got Data from Cache")
            return try cache.getData(as: type)
        }
        print( "Fetching Data from API")
        let url = try buildUrl()
        let (data,response) = try await URLSession.shared.data(from: url)
        try validateResponse(response: response)
        
        let result = try JSONDecoder().decode([T].self, from: data)
        if let cache{
            savelastfetchedtime()
            cache.saveData(as: result)
            }
        return result
      
    }
   
    private func buildUrl() throws -> URL{
        guard var Urlcomponents =  URLComponents(string: baseurl) else {
            throw ApiError.invalidurl
        }
        Urlcomponents.path = endpoint.path
        guard let url = Urlcomponents.url else{
            throw ApiError.invalidurl
        }
        return url
    }
    
    
    private func validateResponse(response:URLResponse)throws{
        guard let httpresponse = response as? HTTPURLResponse else {
            throw ApiError.invalidResponse
        }
        guard httpresponse.statusCode == 200 else {
            throw ApiError.invalidResponse
        }
    }
    private func savelastfetchedtime(){
        UserDefaults.standard.set(Date(), forKey: "lastfetchedtime")
    }
    private  func getlastfetchedtime(){
        self.lastfecthedtime = UserDefaults.standard.value(forKey:"lastfetchedtime" ) as? Date
    }
    private var needrefresh:Bool{
        guard let lastfecthedtime else{return true}
        return Date().timeIntervalSince(lastfecthedtime) >= refreshinterval
        
    }
    
}
enum FakeStoreEndPoints{
    case products
    case users
    
    var path:String{
        switch self {
        case .products:
            return "/products"
        case .users:
            return "/users"
        }
    }
}
