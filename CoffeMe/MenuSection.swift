//
//  MenuSection.swift
//  CoffeMe
//
//  Created by Omar on 20.08.23.
//

import Foundation

struct MenuSection: Identifiable, Codable {
    let id: UUID
    let name: String
    let drinks: [Drink]
    
}
