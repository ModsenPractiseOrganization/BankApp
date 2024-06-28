//
//  SelectAccountViewModel.swift
//  BankApp
//
//  Created by Paul Makey on 28.06.24.
//

import Foundation
// Слышал, что так делать неправильно, но иначе нельзя избавиться от тернарного
// оператора во View
import SwiftUI

final class SelectAccountViewModel: ObservableObject {
    
    let accounts = AccountsProvider.getAccounts()
    
    func setNewAccountValue(_ account: Account) {
        AccountsProvider.currentAccount = account
    }
    
    func setBackgroundColor(forAccount account: Account) -> Color {
        isAccountEqualToCurrent(account: account) ? .selection : .viewBackground
    }

    private func isAccountEqualToCurrent(account: Account) -> Bool {
        AccountsProvider.currentAccount.id == account.id
    }
}
