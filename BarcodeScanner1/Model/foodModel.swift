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
    var name: String
    var expiryingDate: Date
    
    init(name: String, expiryingDate: Date) {
        self.name = name
        self.expiryingDate = expiryingDate
    }
}
