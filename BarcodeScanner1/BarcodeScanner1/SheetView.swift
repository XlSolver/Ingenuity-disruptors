//
//  SheetView.swift
//  BarcodeScanner1
//
//  Created by Francesca Ferrini on 21/02/24.
//

import SwiftUI
import SwiftData
struct SheetView: View {
    
    @Environment(\.dismiss) var dismiss
    @Binding var barcode: String
    @Binding  var productResponse: ProductResponse?
    @ObservedObject var savedProduct: SavedFoodViewModel
    @State var saved: SavedFoodModel?
    @Binding var expiryingDate: Date
    
    var body: some View {
        NavigationStack {
            Text("Product Name: \(productResponse?.product?.productName ?? "Unknown")")
            AsyncImage(url: productResponse?.product?.image)
                .padding()
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
            
            //DatePicker("Expiry date", selection: $expiryingDate, displayedComponents: [.date])
            .toolbar {
                ToolbarItem (placement: .topBarTrailing) {
                    if(productResponse?.product?.productName == nil ) {
                        Button("Try again") {
                         
                            dismiss()
                        }
                    } else {
                        Button("Save") {
                            saved = SavedFoodModel(productName: productResponse?.product?.productName, imageUrl: productResponse?.product?.image)
                            savedProduct.savedFoods.append(saved!)
                            dismiss()
                        }
                    }
                }
            }
        }
    }
}


