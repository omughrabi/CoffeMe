//
//  CustomizedView.swift
//  CoffeMe
//
//  Created by Omar on 20.08.23.
//

import SwiftUI

struct CustomizedView: View {
    let drink: Drink
    
    @EnvironmentObject var menu: Menu
    @EnvironmentObject var history: History
    
    @State var size = 0
    @State var isDecaf = false
    @State var extraShots = 0
    @State var milk = ConfigurationOption.none
    @State var syrup = ConfigurationOption.none
    
    
    let sizeOptions = ["Small", "Medium", "Larg"]
    var caffeine: Int {
        var caffeineAmount = drink.caffeine[size]
        caffeineAmount += (extraShots * 60)
        
        if isDecaf {
            caffeineAmount /= 25
        }
        
        return caffeineAmount
    }
    
    var calories: Int {
        var caloriesAmount = drink.baseCalories
        
        caloriesAmount += (extraShots * 10)
        
        if drink.coffeeBased {
            caloriesAmount += milk.calories
        } else {
            caloriesAmount += (milk.calories / 8)

        }
        
        return caloriesAmount * (size + 1)
    }
    
    var body: some View {
        Form {
            Section ("Basic Options"){
                Picker("Size", selection: $size){
                    ForEach(sizeOptions.indices) { index in
                        Text(sizeOptions[index])
                    }
                }
                .pickerStyle(.segmented)
                if drink.coffeeBased {
                    Stepper("Extra shots: \(extraShots)", value: $extraShots, in: 0...8)
                }
                Toggle("Decaffeine", isOn: $isDecaf)
            }
            
            Section("Customization") {
                Picker("Milk", selection: $milk) {
                    ForEach(menu.milkOptions) { option in
                        Text(option.name)
                            .tag(option)
                    }
                }

                if drink.coffeeBased {
                    Picker("Syrup", selection: $syrup) {
                        ForEach(menu.syrupOptions) { option in
                            Text(option.name)
                                .tag(option)
                        }
                    }
                }
            }

            Section("Estimate") {
                
                Text("**Caffeine:** \(caffeine) mg")
                Text("**Calories:** \(calories)")
                
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(drink.name)
        .toolbar{
            Button("Save"){
                history.add(drink, size: sizeOptions[size], extraShots: extraShots, isDecaf: isDecaf, milk: milk, syrup: syrup, caffeine: caffeine, calories: calories)
            }
            
        }

    }
}

struct CustomizedView_Previews: PreviewProvider {
    static var previews: some View {
        CustomizedView(drink: Drink.example)
            .environmentObject(Menu())
    }
}
