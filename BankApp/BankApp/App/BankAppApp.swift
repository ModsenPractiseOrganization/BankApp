//
//  BankAppApp.swift
//  BankApp
//
//  Created by Paul Makey on 25.06.24.
//

import SwiftUI

@main
struct BankAppApp: App {
    
    @StateObject private var selectAccountVM = SelectAccountViewModel()
    @StateObject private var allTransactionsVM = AllTransactionsViewModel()
    @StateObject private var currentAccountVM = CurrentAccountViewModel()
    @StateObject private var dateRangePickerVM = DateRangePickerViewModel()
    
    var body: some Scene {
        WindowGroup {
            CurrentAccountView()
        }
        .environmentObject(selectAccountVM)
        .environmentObject(allTransactionsVM)
        .environmentObject(currentAccountVM)
        .environmentObject(dateRangePickerVM)
    }
}
