//
//  TabController.swift
//  BarcodeScanner1
//
//  Created by Francesca Ferrini on 20/02/24.
//

import Foundation
import SwiftUI

/*struct OnBoarding{
    let image: String
    let title: String
    let
}*/
struct TabController: View {
    @ObservedObject var savedProduct: SavedFoodViewModel = SavedFoodViewModel()
    @State private var selection = 1 // Impostiamo la selezione iniziale sulla scheda dello scanner
    
    var body: some View {
        TabView(selection: $selection){
            TipsView()
                .tag(0) // Assegniamo il tag 0 alla scheda "Tips"
                .tabItem {
                    Label("Tips", systemImage: "lightbulb.min")
                }
            ContentView(savedProduct: savedProduct)
                .tag(1) // Assegniamo il tag 1 alla scheda "Scanner"
                .tabItem {
                    Label("Scan", systemImage: "barcode.viewfinder")
                }
            ListView(savedProduct: savedProduct)
                .tag(2) // Assegniamo il tag 2 alla scheda "Book"
                .tabItem {
                    Label("Book",systemImage: "book")
                }
        }
        .onAppear(){
            UITabBar.appearance().backgroundColor = .lightGray
        }
        .accentColor(.white)
        .onAppear {
            // Impostiamo la selezione iniziale sulla scheda dello scanner (indice 1)
            DispatchQueue.main.async {
                selection = 1
            }
        }
    }
}

#Preview {
    TabController()
}
