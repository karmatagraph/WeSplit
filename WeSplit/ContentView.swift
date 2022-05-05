//
//  ContentView.swift
//  WeSplit
//
//  Created by karma on 5/5/22.
//

import SwiftUI

struct ContentView: View {
    @State private var chequeAmt = 0.0
    @State private var numPeople = 2
    @State private var tipPercentage = 20
    
    let tipPercentages = [10,15,20,25,0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numPeople+2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = chequeAmt/100 * tipSelection
        let grandTotal = chequeAmt + tipValue
        let amtPerPerson = grandTotal/peopleCount
        return amtPerPerson
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Enter the check amount", value: $chequeAmt, format: .currency(code: Locale.current.currencyCode ?? "USD") )
                        .keyboardType(.decimalPad)
                    
                    
                    // allow the user to input how many people are there
                    Picker("Number of people", selection: $numPeople){
                        ForEach(2..<100){
                            Text("\($0) people")
                        }
                    }
                    
                }
                
                Section{
                    Picker("Tip percentage", selection:  $tipPercentage){
                        ForEach(tipPercentages, id: \.self){
                            Text($0 , format: .percent)
                        }
                        
                    }.pickerStyle(.segmented)
                    
                } header: {
                    Text("How much tip you want to leave?")
                }
 
                Section{
                    Text(totalPerPerson, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                }
                
            }
            .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
