//
//  Product.swift
//  BarcodeScanner1
//
//  Created by Fernando Sensenhauser on 22/02/24.
//

import Foundation
struct Product: Codable {
    let productName: String?
    let nutriments: Nutriments?
    let nutriscoreData: NutriscoreData?
    let nutritionGrades: String?
    let image: URL
    
    private enum CodingKeys: String, CodingKey {
        case productName = "product_name"
        case nutriments
        case nutriscoreData = "nutriscore_data"
        case nutritionGrades = "nutrition_grades"
        case image = "image_url"
    }
}


struct ProductResponse: Codable {
    let code: String
    let product: Product?
    let status: Int
    let statusVerbose: String
    
    private enum CodingKeys: String, CodingKey {
        case code, product, status
        case statusVerbose = "status_verbose"
    }
}


struct Nutriments: Codable {
    let carbohydrates: Double?
    let sugars: Double?
    let energy: Int?
    let energyKcal: Int?
    
    private enum CodingKeys: String, CodingKey {
        case carbohydrates, sugars, energy
        case energyKcal = "energy-kcal"
    }
}

struct NutriscoreData: Codable {
    let energyPoints: Int?
    let sugarsPoints: Int?
    let saturatedFatPoints: Int?
    let sodiumPoints: Int?
    let fiberPoints: Int?
    let proteinsPoints: Int?
    let fruitsVegetablesNutsPoints: Int?
    let score: Int?
    let grade: String?
    
    private enum CodingKeys: String, CodingKey {
        case energyPoints = "energy_points"
        case sugarsPoints = "sugars_points"
        case saturatedFatPoints = "saturated_fat_points"
        case sodiumPoints = "sodium_points"
        case fiberPoints = "fiber_points"
        case proteinsPoints = "proteins_points"
        case fruitsVegetablesNutsPoints = "fruits_vegetables_nuts_points"
        case score, grade
    }
}

class SavedFoodViewModel: ObservableObject, Identifiable{
    @Published var savedFoods: [SavedFoodModel] = []
   
    init() {
        
    }
}

struct SavedFoodModel: Hashable, Identifiable {
    let id: UUID = UUID()
    let productName: String?
    let imageUrl: URL?
    
}
