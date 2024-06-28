//
//  CurrentAccountViewModel.swift
//  BankApp
//
//  Created by Paul Makey on 25.06.24.
//

import Foundation

final class CurrentAccountViewModel: ObservableObject {

    @Published var currentTransaction: Transaction?
    @Published var shouldOpenAccounSheet = false
    
    let accounts = AccountsProvider.getAccounts()
    let transactions = TransactionsProvider.getTransactions()
    
    var currentAccount: Account {
        AccountsProvider.currentAccount
    }
    
    var limitedTransactions: [Transaction] {
        Array(transactions.prefix(4))
    }
    
    func openSheet() {
        shouldOpenAccounSheet.toggle()
    }
    
    func isTransactionLast(_ transaction: Transaction) -> Bool {
        transaction == limitedTransactions.last
    }
    
    func setNewTransaction(_ transaction: Transaction) {
        currentTransaction = transaction
    }
}
