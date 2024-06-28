//
//  AllTransactionsViewModel.swift
//  BankApp
//
//  Created by Paul Makey on 28.06.24.
//

import Foundation

final class AllTransactionsViewModel: ObservableObject {
    
    @Published var currentTransaction: Transaction?
    @Published var showDatePicker = false
    @Published var startDate: Date? = nil
    @Published var endDate: Date? = nil
    
    private let transactions = TransactionsProvider.getTransactions()
    
    var filteredTransactions: [Transaction] {
        guard let startDate, let endDate else { return transactions }
        return transactions.filter {
            $0.date >= startDate && $0.date <= endDate
        }
    }

    func isTransactionLast(_ transaction: Transaction) -> Bool {
        transaction != transactions.last
    }
    
    func setNewTransactionValue(_ transaction: Transaction) {
        currentTransaction = transaction
    }
    
    func hideDatePicker() {
        showDatePicker = false
    }
}
