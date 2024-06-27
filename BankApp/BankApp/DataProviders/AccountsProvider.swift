//
//  AccountsProvider.swift
//  BankApp
//
//  Created by Paul Makey on 25.06.24.
//


struct AccountsProvider {
    static var currentAccount = AccountsProvider.getAccounts().first!
    
    static func getAccounts() -> [Account] {
        [
            Account(
                name: "My first account",
                number: "91212192291221",
                pin: "1234 1234"
            ),
            Account(
                name: "For travelling",
                number: "91212192291221",
                pin: "1234 1234"
            ),
            Account(
                name: "Saving Account",
                number: "91212192291221",
                pin: "1234 1234"
            )
        ]
    }
}
