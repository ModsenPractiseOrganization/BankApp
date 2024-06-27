//
//  Account.swift
//  BankApp
//
//  Created by Paul Makey on 25.06.24.
//

import Foundation

struct Account: Identifiable {
    let id = UUID()
    let name: String
    let number: String
    let pin: String
    
    var hiddenPin: String {
        let components = pin.components(separatedBy: " ")
        let firstPart = String(repeating: "•", count: components.first?.count ?? 0)
        let secondPart = components.last ?? ""
        
        return "\(firstPart) \(secondPart)"
    }
}
