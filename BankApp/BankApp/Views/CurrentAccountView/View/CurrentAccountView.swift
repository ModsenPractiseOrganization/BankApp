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
                CurrentAccountView()
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
                            Divider()
                        }
                    }
                }
            }
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundStyle(.viewBackground)
            }
            
            Spacer()
        }
    }
    
    @ViewBuilder
    func CurrentAccountView() -> some View {
        HStack {
            Image("cardImage")
                .resizable()
                .frame(width: 40, height: 25)
                .padding(.top, -35)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(currentAccount?.name ?? "")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                
                Text(currentAccount?.number ?? "")
                    .fontWeight(.semibold)
                    .font(.subheadline)
                    .foregroundStyle(.secondaryText)
                
                Text(currentAccount?.hiddenPin ?? "")
                    .fontWeight(.semibold)
                    .font(.subheadline)
                    .foregroundStyle(.secondaryText)
            }
            .padding([.top, .bottom], 5)
            
            Spacer()
            
            Image("chevron.forward")
        }
        .padding()
        .frame(width: UIScreen.main.bounds.width - 8)
        .background {
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(.viewBackground)
        }
    }
}

#Preview {
    CurrentAccountView()
}
