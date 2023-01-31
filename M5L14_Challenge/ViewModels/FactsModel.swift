//
//  FactsModel.swift
//  M5L14_Challenge
//
//  Created by tom montgomery on 1/30/23.
//

import Foundation

class FactsModel: ObservableObject {
    
    @Published var currentFact = ""
    
    init() {
        
        // may not be necessary
        getRandomFact()
    }
    
    
    func getRandomFact() {
        // set the String path
        let urlString = "http://numbersapi.com/random/trivia"

        // Create URL object from
        let url = URL(string: urlString)

        guard url != nil else {
            // guard body must return or throw
            // couldn't create a URL, return nothing
            return
        }

        // Create URLRequest object
        let request = URLRequest(url: url!)
        
        // get the session before we kick off the task
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            // No need to parse b/c (do-try-catch) because we are just doing the raw string, no json
            // at least check for an error
            guard error == nil else {
                // there was an error - bail
                print(error?.localizedDescription ?? "unknown error")
                return
            }
            
            // make sure there is data
            if let data = data {
                
                // Turn the data into text.  current type = Data?
                if let stringData = String(data: data, encoding: .utf8) {
                    // UI updates must happen on the main thread
                    DispatchQueue.main.async {
                        self.currentFact = stringData
                    }
                }
                
            }
            
            
            
        }
        // fire the call!  invoke the handler!
        dataTask.resume()
        // may also do it as a modifier if we don't want to assign session.dataTask to anything
    }
    
}
