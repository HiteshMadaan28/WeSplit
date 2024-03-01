//
//  ContentView.swift
//  WeSplit
//
//  Created by Hitesh Madaan on 01/03/24.
//

import SwiftUI

//struct ContentView: View{
//    
//    @State private var checkAmout=0.0
//    @State private var numberOfPeople=2
//    @State private var tipAmount=10
//    
//    let tipPercentage=[10,15,20,25,0]
//    
//    var body: some View{
//        NavigationStack{
//            Form{
//                Section{
//                    TextField("Enter The Check Amount",value: $checkAmout,format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
//                        .keyboardType(.decimalPad)
//                }
//                Section{
//                    Text(checkAmout,format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
//                }
//            }
//            
//            .navigationTitle("WeSplit")
//            .navigationBarTitleDisplayMode(.inline)
//            
//            
//        }
//    }
//}

struct ContentView: View {
    @State private var name=""
    @State private var tapCount=0
    
    var arrayOfStudents=["Hitesh","Atul","Honey"]
    @State private var selectedStudent="Hitesh"
    
    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//        }
//        .padding()
        
        NavigationStack{
            
            Form{
                Section{
                    Text("Hello World!..")
                }
                
                Section{
                    Picker("Select any Student",selection: $selectedStudent){
                        ForEach(arrayOfStudents,id: \.self){
                            Text($0)
                        }
                    }
                }
                
                
                TextField("Enter your name",text: $name)
                Text("This is \(name)")
                Text("Creating")
                Text("First SwiftUI")
                Text("Application")
                
                Section{
                    Text("Form and Sections")
                    Text("Features of Swift")
                    Text("🥳🥳🥳🥳🥳")
                }
                
//                ForEach(0..<100){
//                    Text("No. is \($0)")
//                }
                                
            }
            
            
            
            Button("Tap Count : \(tapCount)"){
                tapCount += 1
            }
            .navigationTitle("SwiftUI")
            .navigationBarTitleDisplayMode(.inline)
            
            
        }
        
        
        
    }
}

#Preview {
    ContentView()
}
