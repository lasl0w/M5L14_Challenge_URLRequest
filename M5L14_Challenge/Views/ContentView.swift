//
//  ContentView.swift
//  M5L14_Challenge
//
//  Created by tom montgomery on 1/29/23.
//

import SwiftUI
//import Foundation




struct ContentView: View {
    
    // use the EO, from our entry point modifier
    //@EnvironmentObject var model: FactsModel
    @ObservedObject var model: FactsModel
    
    var body: some View {
        
        VStack {
            Text(model.currentFact)
                .padding()
            
            Button("Get a new fact!") {
                model.getRandomFact()
            }
        }

        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(model: FactsModel())
    }
}
