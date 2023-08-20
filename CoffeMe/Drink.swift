//
//  Drink.swift
//  CoffeMe
//
//  Created by Omar on 20.08.23.
//

import Foundation

struct Drink: Identifiable, Codable {
    let id: UUID
    let name: String
    let caffeine: [Int]
    let coffeeBased: Bool
    let servedWithMilk: Bool
    let baseCalories: Int

    var image: String {
        name.lowercased().replacingOccurrences(of: " ", with: "-")
    }
    
    static let example = Drink(id: UUID(), name: "Example Drink", caffeine: [100, 120, 180], coffeeBased: true, servedWithMilk: true, baseCalories: 100)
}
