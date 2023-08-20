//
//  History.swift
//  CoffeMe
//
//  Created by Omar on 20.08.23.
//

import Foundation

class History: ObservableObject {
    @Published var servings: [Serving]
    
    let savePath = FileManager.documentDirectory.appendingPathComponent("Saved Drinks")
    
    init() {
        do {
            let data = try Data(contentsOf: savePath)
            servings = try JSONDecoder().decode([Serving].self, from: data)
            
        } catch {
            servings = []
            
        }
    }
    func save () {
        do {
            let data = try JSONEncoder().encode(servings)
            
            try data.write(to: savePath, options: [.atomic, .completeFileProtection])
            
        } catch {
            print("Unable to Save to data")
        }
    }
    
    func add (_ drink: Drink, size: String, extraShots: Int, isDecaf: Bool, milk: ConfigurationOption, syrup: ConfigurationOption, caffeine: Int, calories: Int) {
        var description = [String]()
        
        description.append(size)
        
        if isDecaf {
            description.append("Decaffeinated")
        }
        
        switch extraShots {
        case 0:
            break
        case 1:
            description.append("One Extra Shot")
        default:
            description.append("\(extraShots) extra Shots")
        }
        if milk != .none {
            description.append("\(milk.name.lowercased()) Milk")
        }
        if syrup != .none {
            description.append("\(syrup.name.lowercased()) Syrup")
        }
        description.append("\(caffeine) mg of Caffeine")
        description.append("and \(caffeine) carlries")
        
        let descriptionString = description.joined(separator: ", ")
        
        let serving = Serving(id: UUID(), name: drink.name, description: descriptionString, caffeine: caffeine, calories: calories)
        
        servings.insert(serving, at: 0)
        
        save()
    }
}
