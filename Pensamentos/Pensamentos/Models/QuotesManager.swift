//
//  QuotesManager.swift
//  Pensamentos
//
//  Created by Jeiel Lima on 17/08/22.
//

import Foundation

class QuotesManager {
    let quotes: [Quote]
    
    init() {
        let fileURL = Bundle.main.url(forResource: "quotes", withExtension: "json")!
        let jsonData = try! Data(contentsOf: fileURL)
        let jsonDecoder =  JSONDecoder()
        quotes = try! jsonDecoder.decode([Quote].self, from: jsonData)
    }
    
    func getRandomQuotes() -> Quote {
        let index = Int(arc4random_uniform(UInt32(quotes.count)))
        return quotes[index]
        
    }
}
