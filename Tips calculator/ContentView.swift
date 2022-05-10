//
//  ContentView.swift
//  Tips calculator
//
//  Created by Artemiy Kirillov on 10.05.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var amount = ""
    @State private var persons = 2
    @State private var selectedPercent = 0
    
    let percentages = [0, 5, 10, 15, 25]
    
    var totalPercent: Double {
        let peopleCount = Double(persons + 2)
        let tipSelection = Double(percentages[selectedPercent])
        let orderAmount = Double(amount) ?? 0
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        return grandTotal / peopleCount
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $amount)
                    Picker("Number of persons", selection: $persons) {
                        ForEach(2 ..< 11) {
                            Text("\($0) persons")
                        }
                    }
                }
                
                Section(header: Text("Percent of tips")) {
                    Picker("Tips percent", selection: $selectedPercent) {
                        ForEach(0 ..< percentages.count) {
                            Text("\(self.percentages[$0])%")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Amount per person") {
                    Text("\(totalPercent, specifier: "%.2f")")
                }
            }
            
            .navigationTitle(Text("Tips calculator"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
