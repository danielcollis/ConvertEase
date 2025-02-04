//
//  ContentView.swift
//  ConvertEase
//
//  Created by Daniel Collis on 2/4/25.
//

import SwiftUI

struct ContentView: View {
    @State private var inputValue = 0.0
    @State private var selectedInput = "Hours"
    @State private var selectedOutput = "Hours"
    
    let timeUnits = ["Seconds", "Minutes", "Hours", "Days", "Weeks"]
    
    var inputInSeconds: Double {
        switch selectedInput {
        case "Minutes":
            return inputValue * 60
        case "Hours":
            return inputValue * 3600
        case "Days":
            return inputValue * 86_400
        case "Weeks":
            return inputValue * 604_800
        default:
            return inputValue
        }
    }
        
    var outputValue: Double {
        switch selectedOutput {
        case "Minutes":
            return inputInSeconds / 60
        case "Hours":
            return inputInSeconds / 3600
        case "Days":
            return inputInSeconds / 86_400
        case "Weeks":
            return inputInSeconds / 604_800
        default:
            return inputInSeconds
        }
    }
    
    var body: some View {
        NavigationStack {
            Form {
                //section for what you're converting from
                Section("Convert From:") {
                    TextField("Time", value: $inputValue, format: .number)
                    
                    Picker("Select Input", selection: $selectedInput) {
                        ForEach(timeUnits, id: \.self) {unit in
                            Text(unit)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                //section for what you're converting to
                Section("To:") {
                    Text(outputValue, format: .number)
                    
                    Picker("Select Input", selection: $selectedOutput) {
                        ForEach(timeUnits, id: \.self) {unit in
                            Text(unit)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                //output
                Section {
                    
                }
                
            }
            .navigationTitle("ConvertEase")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
