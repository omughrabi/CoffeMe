//
//  ContentView.swift
//  CoffeMe
//
//  Created by Omar on 20.08.23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var menu = Menu()
    @StateObject var history = History()
    @State private var showingAddScreen = false
    
    
    var body: some View {
        NavigationView {
            List {
                if history.servings.isEmpty {
                    Button("Add Your First Drink") {
                        showingAddScreen = true
                    }
                }else {
                    ForEach(history.servings) { serving in
                        HStack {
                            VStack{
                                Text(serving.name)
                                    .font(.headline)
                                Text(serving.description)
                                    .font(.caption)
                            }
                            Spacer()
                            
                            Text("\(serving.caffeine) mg")
                        }
                    }
                }
            }
            .sheet(isPresented: $showingAddScreen, content: MenuView.init)
            .navigationTitle("Coffe Me")
            .toolbar {
                Button {
                    showingAddScreen = true
                } label: {
                    Label("Add New Drink", systemImage: "plus")
                }
            }
        }
        .environmentObject(menu)
        .environmentObject(history)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
