//
//  TransactionDetailsView.swift
//  BankApp
//
//  Created by Paul Makey on 26.06.24.
//

import SwiftUI

struct TransactionDetailsView: View {
    @Environment(\.dismiss) var dismiss
    let transaction: Transaction
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                largeTitle()
                    .padding(.top, 20)
                    .padding(.bottom, 32)
                
                transactionInfoCell(
                    title: "Transaction was applied in",
                    value: transaction.company
                )
                transactionInfoCell(
                    title: "Transaction number",
                    value: transaction.number
                )
                transactionInfoCell(
                    title: "Date",
                    value: transaction.getFormattedDate
                )
                transactionInfoCell(
                    title: "Transaction status",
                    value: transaction.status.rawValue
                )
                transactionInfoCell(
                    title: "Amount",
                    value: transaction.getFormattedAmount
                )
                .padding(.bottom, 32)
                
                CustomButtonView(title: "Okay") {
                    dismiss()
                }
            }
            .padding(.bottom, 20)
        }
        .scrollIndicators(.hidden)
        .background(.black)
    }
    
    @ViewBuilder
    private func largeTitle() -> some View {
        HStack {
            Text("Transaction")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.leading, 6)
            
            Spacer()
        }
    }
    
    @ViewBuilder
    private func transactionInfoCell(title: String, value: String) -> some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title3)
            
            HStack {
                Text(value)
                    .padding()
                
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width - 8)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 1)
            }
        }
    }
}

#Preview {
    TransactionDetailsView(transaction: TransactionsProvider.getTransactions().first!)
}
