//
//  ProductsView.swift
//  FakeStoreApp
//
//  Created by Rachit Sharma on 10/08/2025.
//

import SwiftUI

struct ProductsView: View {
    @State var ViewModel:ProductsViewModel
    @State var searchText: String = ""
    init(service:ProductsServiceProtocol = ProductsService()){
        _ViewModel = State(initialValue: ProductsViewModel(Service: service))
    }
    var body: some View {
        VStack{
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
                                    ForEach(filteredProducts){product in
                                        ProductssubView(product: product)}
                                }
                            }
                            
                            
                        }
                        .searchable(text: $searchText, prompt: "search for products...")
                        .navigationTitle(Text("Products"))
                    }
                    
                }
            }
        .refreshable {
            await ViewModel.refreshProducts()
        }
            .task {
                await ViewModel.fetchProducts()
            }
            
        }
    }
private extension ProductsView {
    var filteredProducts:[Products]{
        guard case.completed(let products) = ViewModel.lodingState else {return []}
        guard !searchText.isEmpty else {return products}
        return products.filter{
            $0.title.localizedCaseInsensitiveContains(searchText) ||
            $0.description.localizedCaseInsensitiveContains(searchText)
            
        }
    }
}


#Preview {
    ProductsView()
}
