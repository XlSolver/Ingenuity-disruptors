//
//  foodieModel.swift
//  Foodie
//
//  Created by Salvatore Flauto on 19/02/24.
//

import Foundation
import SwiftData

@Model
class foodData: Identifiable {
    let id = UUID()
    var temp: String
    var name: String
    var expiryingDate: Date
    
    init(temp: String, name: String, expiryingDate: Date) {
        self.temp = temp
        self.name = name
        self.expiryingDate = expiryingDate
    }
}
