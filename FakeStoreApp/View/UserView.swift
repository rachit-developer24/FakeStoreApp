//
//  UserView.swift
//  FakeStoreApp
//
//  Created by Rachit Sharma on 10/08/2025.
//

import SwiftUI

struct UserView: View {
    @State var Viewmodel:UserViewModel
    let Service:UserServiceProtocol
    init(Service:UserServiceProtocol){
        self.Service=Service
        _Viewmodel = State(initialValue: UserViewModel(Service: Service))
    }
    var body: some View {
        NavigationStack{
            VStack{
                switch Viewmodel.lodingState {
                case .isloading:
                    ProgressView()
                case .empty:
                    ContentUnavailableView("Products Unavailable", systemImage: "cart.slash")
                case .error(let error):
                    Text(error.localizedDescription)
                case .completed(let Data):
                    List{
                        ForEach(Data){user in
                            UserSubView(user: user)
                        }
                    }
                }
            }
            .navigationTitle(Text("Users"))
        }
        .task {
            await Viewmodel.fetchusers()
        }
    }
        

}

#Preview {
    UserView(Service: UserService())
}
