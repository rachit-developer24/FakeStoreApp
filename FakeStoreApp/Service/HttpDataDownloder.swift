//
//  HttpDataDownloder.swift
//  FakeStoreApp
//
//  Created by Rachit Sharma on 15/08/2025.
//

import Foundation
protocol HttpDataDownloderprotocol{
    func fetchdata<T:Decodable>(as type: T.Type , endpoint:FakeStoreEndPoints ) async throws -> [T]
}
class httdataDownloder: HttpDataDownloderprotocol {
    private let baseurl = "https://fakestoreapi.com"
    func fetchdata<T>(as type: T.Type, endpoint: FakeStoreEndPoints) async throws -> [T] where T : Decodable {
        let url = try buildUrl(withendpoint: endpoint)
        let (data,response) = try await URLSession.shared.data(from: url)
        try validateResponse(response: response)
        do {
            let data = try JSONDecoder().decode([T].self, from: data)
            return data
        }catch{
            throw error as? ApiError ?? .invaliddata
        }
    }
   
    private func buildUrl(withendpoint:FakeStoreEndPoints) throws -> URL{
        guard var Urlcomponents =  URLComponents(string: baseurl) else {
            throw ApiError.invalidurl
        }
        Urlcomponents.path = withendpoint.path
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
