//
//  AllTransactionsViewModel.swift
//  BankApp
//
//  Created by Paul Makey on 28.06.24.
//

import Foundation

final class AllTransactionsViewModel: ObservableObject {
    
    @Published var currentTransaction: Transaction?
    
    let transactions = TransactionsProvider.getTransactions()

    func isTransactionLast(_ transaction: Transaction) -> Bool {
        transaction != transactions.last
    }
    
    func setNewTransactionValue(_ transaction: Transaction) {
        currentTransaction = transaction
    }
}
