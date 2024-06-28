//
//  CurrentAccountView.swift
//  BankApp
//
//  Created by Paul Makey on 25.06.24.
//

import SwiftUI

struct CurrentAccountView: View {
    @EnvironmentObject private var viewModel: CurrentAccountViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                title("Account")
                    .padding(.top, 12)
                
                // ACCOUNT
                Button {
                    viewModel.openSheet()
                } label: {
                    CurrentAccountViewCell(currentAccount: viewModel.currentAccount)
                }
                
                // RECENT TRANSACTIONS
                recentTransactions()
                    .padding([.leading, .trailing], 6)
                    .padding(.top, 20)
                
                // LIST
                transactionsList()
                    .padding()
                    .frame(width: UIScreen.main.bounds.width - 8)
                    .background {
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundStyle(.viewBackground)
                    }
                
                Spacer()
            }
            .sheet(item: $viewModel.currentTransaction) { transaction in
                selectTransactionsViewSheet(withTransaction: transaction)
            }
            .sheet(isPresented: $viewModel.shouldOpenAccounSheet) {
                selectAccountViewSheet()
            }
        }
    }
    
    @ViewBuilder
    func title(_ title: String) -> some View {
        HStack {
            Text(title)
                .foregroundStyle(.white)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.leading, 6)
            
            Spacer()
        }
    }
    
    @ViewBuilder
    func recentTransactions() -> some View {
        HStack {
            Text("Recent Transactions")
                .foregroundStyle(.white)
                .font(.title)
                .fontWeight(.bold)
            
            Spacer()
            
            NavigationLink {
                AllTransactionsView()
            } label: {
                Text("VIEW ALL")
                    .font(.subheadline)
                    .fontWeight(.semibold)
            }
        }
    }
    
    @ViewBuilder
    func transactionsList() -> some View {
        VStack {
            ForEach(viewModel.limitedTransactions) { transaction in
                VStack {
                    TransactionView(transaction: transaction)
                    if !viewModel.isTransactionLast(transaction) {
                        Divider()
                    }
                }
                .onTapGesture {
                    viewModel.setNewTransaction(transaction)
                }
            }
        }
    }
    
    @ViewBuilder
    func selectAccountViewSheet() -> some View {
        SelectAccountView()
            .background(Color.black)
            .presentationDragIndicator(.visible)
            .presentationDetents([.fraction(0.9)])
    }
    
    @ViewBuilder
    func selectTransactionsViewSheet(withTransaction transaction: Transaction) -> some View {
        TransactionDetailsView(transaction: transaction)
            .presentationDetents([.large])
    }
}

#Preview {
    CurrentAccountView()
}
