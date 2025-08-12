//
//  ApiError.swift
//  FakeStoreApp
//
//  Created by Rachit Sharma on 12/08/2025.
//

import Foundation
enum ApiError:Error{
    case invalidResponse
    case invaliddata
    case invalidurl
}
extension ApiError:LocalizedError{
    var errorDescription: String? {
        switch self {
        case .invalidResponse:
            return "Invalid Response"
        case .invaliddata:
            return "Invalid Data"
        case .invalidurl:
            return "Invalid URL"
        }
    }
}
