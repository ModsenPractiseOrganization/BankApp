//
//  AllTransactionsView.swift
//  BankApp
//
//  Created by Paul Makey on 26.06.24.
//

import SwiftUI

struct AllTransactionsView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject private var viewModel: AllTransactionsViewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack {
                        ForEach(viewModel.transactions) { transaction in
                            VStack {
                                TransactionView(transaction: transaction)
                                if viewModel.isTransactionLast(transaction) {
                                    Divider()
                                }
                            }
                            .onTapGesture {
                                viewModel.setNewTransactionValue(transaction)
                            }
                        }
                    }
                    .padding()
                    .frame(width: UIScreen.main.bounds.width - 8)
                    .background {
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundStyle(.viewBackground)
                    }
                    .sheet(item: $viewModel.currentTransaction) { transaction in
                        TransactionDetailsView(transaction: transaction)
                            .presentationDetents([.large])
                    }
                }
                .padding(.top, 20)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    sortBarButton()
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    backBarButton()
                }
            }
            .navigationBarBackButtonHidden()
            .navigationTitle("All Transactions")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    @ViewBuilder
    func sortBarButton() -> some View {
        Button {
            // MARK: - Мне так и не скинули DatePicker 🥄
        } label: {
            Image(systemName: "ellipsis.circle")
                .foregroundStyle(.white)
                .fontWeight(.semibold)
        }
    }
    
    @ViewBuilder
    func backBarButton() -> some View {
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
