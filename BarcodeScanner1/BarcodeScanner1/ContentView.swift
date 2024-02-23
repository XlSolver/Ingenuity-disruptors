//
//  ContentView.swift
//  BarcodeScanner1
//
//  Created by Francesca Ferrini on 20/02/24.
//

import SwiftUI
import OpenFoodFactsSDK


struct ContentView: View {
    
    
    @State private var barcode: String = ""
    @State private var isEditing = false
    @State private var isInvalidCode = false
    @State private var isScanning = true
    
    @State private var productResponse: ProductResponse?
    @State private var isLoading = false
    @State private var errorMessage: String?
    @State private var isShowingScanner = false
    @ObservedObject var savedProduct: SavedFoodViewModel
    
    private func resetState() {
        isInvalidCode = false
        barcode = ""
        isScanning = true
    }
    
    var body: some View {
        
        NavigationStack {
            
            BarcodeScannerScreen(barcode: $barcode, isCapturing: $isScanning).ignoresSafeArea(.all)
            
            
                
                .onChange(of: isEditing) { newValue in
                    if newValue == false {
                        resetState()
                    }
                }
                .onChange(of: barcode) { newValue in
                    if newValue.isEmpty { return }
                    print("Found barcode \(barcode) which \(barcode.isAValidBarcode() ? "Valid" : "Invalid")")
                    fetchProductData()
                    
                    print("Product Name: \(productResponse?.product?.productName ?? "Unknown")")
                    if newValue.isAValidBarcode() {
                        isEditing = true
                    } else {
                        isInvalidCode = true
                    }
                }
                .alert("Invalid barcode", isPresented: $isInvalidCode) {
                    Button("Dismiss") {
                        resetState()
                    }
                } message: {
                    Text("Barcode \(barcode) is invalid. Expected format should have 7,8,12 or 13 digits.")
                }
        
    }.sheet(isPresented: $isEditing, content: {
        SheetView(barcode: $barcode, productResponse: $productResponse, savedProduct: savedProduct, expiryingDate: .constant(Date()))
    })
}

    func fetchProductData() {
        barcode = barcode
          

        isLoading = true
        errorMessage = nil

        let apiUrl = "https://world.openfoodfacts.net/api/v2/product/\(barcode).json"

        if let url = URL(string: apiUrl) {
            let session = URLSession.shared

            let task = session.dataTask(with: url) { data, response, error in
                DispatchQueue.main.async {
                    if let error = error {
                        errorMessage = error.localizedDescription
                        isLoading = false
                        return
                    }

                    guard let data = data else {
                        errorMessage = "No data returned from API"
                        isLoading = false
                        return
                    }

                    do {
                        let decoder = JSONDecoder()
                        let result = try decoder.decode(ProductResponse.self, from: data)

                        productResponse = result
                    } catch {
                        errorMessage = "Error decoding JSON: \(error)"
                    }

                    isLoading = false
                }
            }

            task.resume()
        } else {
            errorMessage = "Invalid API URL"
            isLoading = false
        }
    }
}

