//
//  CurrentAccountView.swift
//  BankApp
//
//  Created by Paul Makey on 25.06.24.
//

import SwiftUI

struct CurrentAccountView: View {
    
    @State private var currentAccount = AccountsProvider.getAccounts().first
    @State private var currentTransaction: Transaction?
    @State private var shouldOpenAccounSheet = false
    
    private let accounts = AccountsProvider.getAccounts()
    private let recentTransactions = RecentTransactionsProvider.getRecentTransactions()
    
    var body: some View {
        GeometryReader { proxy in
            NavigationStack {
                VStack {
                    HStack {
                        Text("Account")
                            .foregroundStyle(.white)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(.leading, 6)
                        
                        Spacer()
                    }
                    .padding(.top, 12)
                    
                    // ACCOUNT
                    Button {
                        shouldOpenAccounSheet.toggle()
                    } label: {
                        CurrentAccountViewCell(currentAccount: currentAccount!)
                    }
                    
                    // RECENT TRANSACTIONS
                    HStack {
                        Text("Recent Transactions")
                            .foregroundStyle(.white)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        NavigationLink {
                            AllTransactionsView(transactions: recentTransactions)
                        } label: {
                            Text("VIEW ALL")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                        }
                    }
                    .padding([.leading, .trailing], 6)
                    .padding(.top, 20)
                    
                    // LIST
                    VStack {
                        ForEach(recentTransactions.prefix(4)) { transaction in
                            VStack {
                                TransactionView(transaction: transaction)
                                if transaction != recentTransactions.prefix(4).last {
                                    Divider()
                                }
                            }
                            .onTapGesture {
                                currentTransaction = transaction
                            }
                        }
                    }
                    .padding()
                    .frame(width: UIScreen.main.bounds.width - 8)
                    .background {
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundStyle(.viewBackground)
                    }
                    
                    Spacer()
                }
                .sheet(item: $currentTransaction) { transaction in
                    TransactionDetailsView(transaction: transaction)
                        .presentationDetents([.large])
                }
                .sheet(isPresented: $shouldOpenAccounSheet) {
                    SelectAccountView(
                        currentAccount: $currentAccount,
                        accounts: accounts
                    )
                        .background(Color.black)
                        .presentationDragIndicator(.visible)
                        .presentationDetents([.fraction(0.9)])
                }
            }
        }
    }
}

#Preview {
    CurrentAccountView()
}
