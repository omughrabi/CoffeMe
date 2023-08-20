//
//  Serving.swift
//  CoffeMe
//
//  Created by Omar on 20.08.23.
//

import Foundation

struct Serving: Identifiable, Codable {
    
    var id: UUID
    let name: String
    let description: String
    let caffeine: Int
    let calories: Int
}
