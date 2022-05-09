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
    @State private var tipPercentage = 20 // {
//        didSet{
//            if tipPercentage == 0 {
//                print("tip percent is 0% --------------------")
//                shouldBeRed = true
//            }
//        }
//    }
    @State private var shouldBeRed = false
    
  
    
    
    
//    let tipPercentages = [10,15,20,25,0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numPeople+2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = chequeAmt/100 * tipSelection
        let grandTotal = chequeAmt + tipValue
        let amtPerPerson = grandTotal/peopleCount
        return amtPerPerson
    }
    
    var grandTotalAll: Double {
        let totalpp = totalPerPerson
        let personCount = Double(numPeople + 2)
        let grandTotal = totalpp * personCount
        return grandTotal
    }
    
    
//    var tipForeground: Bool {
//        if tipPercentage == 0 {
//            return true
//        }
//        return false
//    }
    
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
                        ForEach(0..<101){
                            Text($0 , format: .percent)
                        }
                    }
                    .onChange(of: tipPercentage) { newValue in
                        if newValue == 0 {
                            shouldBeRed = true
                        }else {
                            shouldBeRed = false
                        }
                    }
                    
                    
                } header: {
                    Text("How much tip you want to leave?")
                }
 
                Section{
                    Text(totalPerPerson, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                }header: {
                    Text("Amount per person")
                }
                Section{
                    Text(grandTotalAll,format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        .foregroundColor(shouldBeRed ? .red : nil)
                }header: {
                    Text("Grand total check for all person")
                        
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
