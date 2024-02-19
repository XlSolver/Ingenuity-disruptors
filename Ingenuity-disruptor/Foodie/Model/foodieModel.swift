//
//  foodieModel.swift
//  Foodie
//
//  Created by Salvatore Flauto on 19/02/24.
//

import Foundation
import SwiftData

@Model
class food {
    let id = UUID()
    var temp: String
    
    init(temp: String) {
        self.temp = temp
    }
}
