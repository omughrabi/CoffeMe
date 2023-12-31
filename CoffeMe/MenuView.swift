//
//  MenuView.swift
//  CoffeMe
//
//  Created by Omar on 20.08.23.
//

import SwiftUI

struct MenuView: View {
    @EnvironmentObject var menu: Menu
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, pinnedViews: .sectionHeaders) {
                    ForEach (menu.sections){ section in
                        Section {
                            ForEach(section.drinks) { drink in
                                NavigationLink {
                                    CustomizedView(drink: drink)
                                } label: {
                                    VStack {
                                        Image(drink.image)
                                            .resizable()
                                            .scaledToFit()
                                            .cornerRadius(10)
                                        
                                        Text(drink.name)
                                            .font(.system(.body, design: .serif))
                                    }
                                    .padding(.bottom)
                                }
                                .buttonStyle(.plain)
                            }
                        } header: {
                            Text(section.name)
                                .font(.system(.title, design: .serif))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding([.top, .bottom, .trailing ], 5)
                                .background(.background)
                        }
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle("ADD Drink")
        }

    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
            .environmentObject(Menu())
    }
}
