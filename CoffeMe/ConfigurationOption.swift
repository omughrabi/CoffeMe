//
//  ConfigurationOption.swift
//  CoffeMe
//
//  Created by Omar on 20.08.23.
//

import Foundation

struct ConfigurationOption: Identifiable, Codable, Hashable {
    let id: UUID
    let name: String
    let calories: Int
    
    static let none = ConfigurationOption(id: UUID(), name: "None", calories: 0)
}
