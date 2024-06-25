//
//  CurrentAccountView.swift
//  BankApp
//
//  Created by Paul Makey on 25.06.24.
//

import SwiftUI

struct CurrentAccountView: View {
    
    @State private var currentAccount = AccountsProvider.getAccounts().first
    private let recentTransactions = RecentTransactionsProvider.getRecentTransactions()
    
    var body: some View {
        
        VStack {
            HStack {
                Text("Account")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.leading, 6)
                
                Spacer()
            }
            .padding(.top, 12)
            
            // ACCOUNT
            Button {
                
            } label: {
                CurrentAccountViewCell(currentAccount: currentAccount!)
            }
            
            // RECENT TRANSACTIONS
            HStack {
                Text("Recent Transactions")
                    .font(.title)
                    .fontWeight(.bold)
                
                Spacer()
                
                Button {
                    
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
                ForEach(recentTransactions.prefix(4), id: \.self) { transaciton in
                    Button {
                        
                    } label: {
                        VStack {
                            TransactionView(transaction: transaciton)
                            if transaciton != recentTransactions.prefix(4).last {
                                Divider()
                            }
                        }
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
    }
}

#Preview {
    CurrentAccountView()
}
