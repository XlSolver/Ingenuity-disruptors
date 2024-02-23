//
//  ListView.swift
//  BarcodeScanner1
//
//  Created by Francesca Ferrini on 20/02/24.
//

import SwiftUI
import SwiftData

struct ListView: View {
    @Environment(\.modelContext) var foodContext
    
    @Query var foodList: [foodData]
    
    
    var body: some View {
        List{
            ForEach(foodList) { food in
                Text("\(food.name)")
                Text("\(food.expiryingDate)")
            }
        }
    }
}

#Preview {
    ListView()
        .modelContainer(foodContainer)
}
