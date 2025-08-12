//
//  ProductsView.swift
//  FakeStoreApp
//
//  Created by Rachit Sharma on 10/08/2025.
//

import SwiftUI

struct ProductsView: View {
    let service:ProductsServiceProtocol
    @State var ViewModel:ProductsViewModel
    init(service:ProductsServiceProtocol){
        self.service = service
        _ViewModel = State(initialValue: ProductsViewModel(Service: service))
    }
    var body: some View {
        Group{
            switch ViewModel.lodingState {
            case .isloading:
                ProgressView()
            case .empty:
                ContentUnavailableView("Products Unavailable", systemImage: "cart.slash")
            case .error(let error):
                Text(error.localizedDescription)
            case .completed( _):
                NavigationStack{
                    VStack{
                        List{
                            VStack(spacing:45){
                            ForEach(ViewModel.products){product in
                                ProductssubView(product: product)}
                        }
                           }
                       
                      
                   }
                   .navigationTitle(Text("Products"))
               }
              
               }
           }
           .task {
               await ViewModel.fetchProducts()
           }
            }
    }


#Preview {
    ProductsView(service: ProductsService())
}
