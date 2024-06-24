//
//  Transaction.swift
//  BankApp
//
//  Created by Paul Makey on 25.06.24.
//

import Foundation

struct Transaction {
    
    enum TransactionStatus {
        case executed
        case declined
        case inProgress
    }
    
    let company: String
    let number: String
    let date: Date
    let status: TransactionStatus
    let amount: Double
}
