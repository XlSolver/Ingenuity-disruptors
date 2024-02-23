//
//  ListView.swift
//  BarcodeScanner1
//
//  Created by Francesca Ferrini on 20/02/24.
//

import SwiftUI

struct ListView: View {
    @ObservedObject var savedProduct: SavedFoodViewModel
    var body: some View {
        VStack {
            ForEach(savedProduct.savedFoods, id: \.self) { food in
                AsyncImage(url: food.imageUrl)
                    .padding()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                Text(food.productName!)
            }
        }
    }
}


