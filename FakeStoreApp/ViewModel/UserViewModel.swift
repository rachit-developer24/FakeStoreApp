//
//  UserViewModel.swift
//  FakeStoreApp
//
//  Created by Rachit Sharma on 15/08/2025.
//

import Foundation
import Observation
@Observable
class UserViewModel {
    var lodingState:ContentLoadingState<User> = .isloading
    var user = [User]()
    let Service:UserServiceProtocol
    init(Service: UserServiceProtocol) {
        self.Service = Service
    }
    func fetchusers()async {
        do{
            self.user = try await Service.fetchusers()
            self.lodingState = user.isEmpty ? .empty : .completed(Data:user )
        }catch{
            self.lodingState = .error(error: error)
        }
        
        }

    
}
