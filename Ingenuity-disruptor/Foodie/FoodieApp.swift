//
//  FoodieApp.swift
//  Foodie
//
//  Created by Salvatore Flauto on 16/02/24.
//

import SwiftUI
import SwiftData


let schemaConfiguration = ModelConfiguration(isStoredInMemoryOnly: false, allowsSave: true)

let foodContainer: ModelContainer = {
    let schema = Schema ([foodData.self])
    let container = try! ModelContainer(for: schema, configurations: schemaConfiguration)
    
    return container
}()

@main
struct FoodieApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
