//
//  UserView.swift
//  FakeStoreApp
//
//  Created by Rachit Sharma on 10/08/2025.
//

import SwiftUI

struct UserView: View {
    @State var Viewmodel = UserViewModel()
    var body: some View {
        NavigationStack{
            VStack{
                List{
                    ForEach(Viewmodel.user){user in
                        UserSubView(user: user)
                    }
                }
                .navigationTitle(Text("Users"))
            }
        }
        .task {
            await Viewmodel.fetchusers()
        }
    }
        

}

#Preview {
    UserView()
}
