//
//  Quotes.swift
//  Pensamentos
//
//  Created by Jeiel Lima on 17/08/22.
//

import Foundation

struct Quote: Codable { //Encodable, Decodable
    let quote: String
    let author: String
    let image: String
    
    var quoteFormated: String {
        return "“" + quote + "”"
    }
    
    var authorFormated: String {
        return "- " + author + " -"
    }
    
}
