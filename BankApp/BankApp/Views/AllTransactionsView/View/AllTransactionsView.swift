//
//  AllTransactionsView.swift
//  BankApp
//
//  Created by Paul Makey on 26.06.24.
//

import SwiftUI

struct AllTransactionsView: View {
    @Environment(\.dismiss) var dismiss
    @State private var currentTransaction: Transaction?
    
    let transactions: [Transaction]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack {
                        ForEach(transactions) { transaction in
                            VStack {
                                TransactionView(transaction: transaction)
                                if transaction != transactions.last {
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
                    .sheet(item: $currentTransaction) { transaction in
                        TransactionDetailsView(transaction: transaction)
                            .presentationDetents([.large])
                    }
                }
                .padding(.top, 20)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "ellipsis.circle")
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("^")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                            .rotationEffect(.degrees(-90))
                            .padding(.leading, 4)
                    }
                }
            }
            .navigationBarBackButtonHidden()
            .navigationTitle("All Transactions")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
