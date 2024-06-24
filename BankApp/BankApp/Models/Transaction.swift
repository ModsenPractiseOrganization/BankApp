//
//  Transaction.swift
//  BankApp
//
//  Created by Paul Makey on 25.06.24.
//

import Foundation

struct Transaction {    
    let company: String
    let number: String
    let date: Date
    let status: TransactionStatus
    let amount: Double
}
