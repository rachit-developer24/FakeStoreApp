//
//  TabView.swift
//  FakeStoreApp
//
//  Created by Rachit Sharma on 11/08/2025.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView{
            ProductsView(service: ProductsService())
                .tabItem{
                    Image(systemName: "cart")
                    Text("Products")
                }
            UserView()
                .tabItem{
                    Image(systemName: "person")
                    Text("Users")
                }
        }
    }
}

#Preview {
    MainTabView()
}
