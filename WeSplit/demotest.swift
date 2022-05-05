////
////  ContentView.swift
////  WeSplit
////
////  Created by karma on 5/5/22.
////
//
//import SwiftUI
//
//struct ContentView: View {
//
//    @State private var tapCount = 0
//    @State private var name = ""
//
//    let avgNepali = ["Ram bahadur", "Shyam bahadur", "sita"]
//    @State private var selectedNepali = "Ram bahadur"
//
//    var body: some View {
//        NavigationView{
//            //            Form{
//            //                Group{
//            //                    Section{
//            //                        Text("Hello,World")
//            //                    }
//            //                    Text("Hello,World")
//            //                    Text("Hello,World")
//            //                    Text("Hello,World")
//            //
//            //                }
//            //
//            //            }.navigationTitle("hello")
//
//            //            Button("Tap count: \(tapCount)"){
//            //                tapCount += 1
//            //            }.navigationTitle("Tap Count")
//            //                .navigationBarTitleDisplayMode(.inline)
////            Form{
////                TextField("enter your name", text: $name)
////                Text("hello, \(name)")
////
////            }
//
//
//
//            Form{
//                Picker("Select Avg Nepali: ", selection: $selectedNepali){
//                    ForEach(avgNepali, id: \.self){
//                        Text($0)
//                    }
//                }
//            }
//
//        }
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
//
