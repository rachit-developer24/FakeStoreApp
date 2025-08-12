//
//  ProductsView.swift
//  FakeStoreApp
//
//  Created by Rachit Sharma on 10/08/2025.
//

import SwiftUI

struct ProductssubView: View {
    let product:Products
    var body: some View {
      
            HStack{
                AsyncImage(url: URL(string: product.image))
                    .scaledToFill()
                    .frame(width: 130, height: 130)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                VStack(alignment:.leading){
                    Text(product.title)
                        .fontWeight(.semibold)
                    Text(product.description)
                        .font(.footnote)
                        .fontWeight(.light)
                }
            }
            .frame(width: 360, height: 100)
            .font(.subheadline)
        }
    
}

#Preview {
    ProductssubView(product: Products(
        id: 1,
        title: "Racing Helmet XR-1",
        price: 249.99,
        description: "Lightweight carbon fiber helmet with aerodynamic vents and anti-fog visor.",
        image: "https://picsum.photos/seed/helmet/200/200"
    ))
}
