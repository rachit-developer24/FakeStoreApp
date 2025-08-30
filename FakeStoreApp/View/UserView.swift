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
    @State var searchText: String = ""
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
                case .completed:
                    List{
                        ForEach(filteresUsers){user in
                            UserSubView(user: user)
                        }
                    }
                }
            }
            .searchable(text: $searchText, prompt: "search for Users")
            .navigationTitle(Text("Users"))
        }
        .task {
            await Viewmodel.fetchusers()
        }
    }
}
private extension UserView {
    var filteresUsers:[User]{
        guard case.completed(let Data)=Viewmodel.lodingState else {
            return  []
        }
        guard !searchText.isEmpty else {
            return Data
        }
        return Data.filter {
            $0.username.localizedCaseInsensitiveContains(searchText) ||
            $0.email.localizedCaseInsensitiveContains(searchText)
        }
    }
}

#Preview {
    UserView(Service: UserService())
}
