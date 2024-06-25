//
//  Transaction.swift
//  BankApp
//
//  Created by Paul Makey on 25.06.24.
//

import Foundation

struct Transaction: Hashable {
    let company: String
    let number: String
    let date: Date
    let status: TransactionStatus
    let amount: Double
    
    var getFormattedAmount: String {
        let formattedAmount = String(format: "%.2f", amount)
        return "$\(formattedAmount)"
    }
    
    var getFormattedDate: String {
        let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd.MM.yyyy"
            return formatter
        }()
        
        return dateFormatter.string(from: date)
    }
}
