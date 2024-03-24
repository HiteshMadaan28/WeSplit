//
//  ContentView.swift
//  WeSplit
//
//  Created by Hitesh Madaan on 01/03/24.
//

import SwiftUI


struct ContentView: View{
    
    @State private var checkAmout = 0.0
    @State private var numberOfPeople = 0
    @State private var tipPercentage = 20
    @FocusState private var amountOfFocus:Bool
    
    var tipPercentages = [10,15,20,25,0]
    
    var checkPlusTip:Double{
        let tipSelection=(Double)(tipPercentage)
        
        let tipAmount=checkAmout/100*tipSelection
        
        return checkAmout+tipAmount
    }
    
    var totalSplit:Double{
        
        let totalPeople=(Double)(numberOfPeople+2)
        let tipSelection=(Double)(tipPercentage)
        
        let tipAmount=checkAmout/100*tipSelection
        
        let amountSplit=(checkAmout+tipAmount)/totalPeople
        
        return amountSplit
    }
    
    var body: some View{
        NavigationStack{
            
            Form{
               
                Section("Total Check Amount"){
                    TextField("Amount",value: $checkAmout,format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountOfFocus)
                    
                    Picker("Number of People",selection:$numberOfPeople){
                        ForEach(2..<100)
                        {
                            Text("\($0) People")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                Section("How much do you want to Tip?"){
                
                    Picker("Tip Percentage",selection: $tipPercentage)
                    {
                        ForEach(tipPercentages,id: \.self)
                        {
                            Text($0,format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                }
                
                Section("Check Amount + Tip "){
                    if(tipPercentage==0){
                        Text(checkPlusTip,format: .currency(code: Locale.current.currency?.identifier ?? "USD")).foregroundColor(.red)
                    }
                    else{
                        Text(checkPlusTip,format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    }
                        
                }
                
                Section("Amount Per Person"){
                    Text(totalSplit,format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            
            .navigationTitle("WeSplit")
            .toolbar{
                if amountOfFocus {
                    Button("done"){
                        amountOfFocus=false
                    }
                }
            }
            
        }
    }
}

#Preview {
    ContentView()
}
