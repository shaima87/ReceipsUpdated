//
//  IngrediantModel View.swift
//  ReceipsUpdated
//
//  Created by Shaima Alhussain on 24/04/1446 AH.
//

import SwiftUI

struct Ingredient: Identifiable {
    let id = UUID()
    var name: String
    var measurement: String
    var servings: Int
}

// Your NewReceips view goes here
