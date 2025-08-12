//
//  UserSubView.swift
//  FakeStoreApp
//
//  Created by Rachit Sharma on 10/08/2025.
//

import SwiftUI

struct UserSubView: View {
    let user:User
    var body: some View {
        HStack(spacing:20){
            Text("\(user.id)")
                .fontWeight(.bold)
            VStack(alignment: .leading){
                Text(user.username)
                    .fontWeight(.bold)
                Text(user.email)
                    .foregroundStyle(.gray)
            }
        }
    }
}

#Preview {
    UserSubView(user: User(id: 6, username: "Rachit", email: "srachit123@gmail.com", password: "coma"))
}
