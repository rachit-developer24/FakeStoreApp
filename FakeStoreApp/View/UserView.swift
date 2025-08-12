//
//  UserView.swift
//  FakeStoreApp
//
//  Created by Rachit Sharma on 10/08/2025.
//

import SwiftUI

struct UserView: View {
    let user = User.MockUser
    var body: some View {
        NavigationStack{
            VStack{
                List{
                    ForEach(user){user in
                        UserSubView(user: user)
                    }
                }
                .navigationTitle(Text("Users"))
            }
        }
    }
}

#Preview {
    UserView()
}
