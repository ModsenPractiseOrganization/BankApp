//
//  TransactionDetailsView.swift
//  BankApp
//
//  Created by Paul Makey on 26.06.24.
//

import SwiftUI

struct TransactionDetailsView: View {
    let transaction: Transaction
    @Environment(\.dismiss) var dismiss
    
    var body: some View {            
        VStack(spacing: 16) {
            HStack {
                Text("Transaction")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.leading, 6)
                
                Spacer()
            }
            .padding(.top, 20)
            .padding(.bottom, 32)
            
            TransactionInfoCell(
                title: "Transaction was applied in",
                value: transaction.company
            )
            TransactionInfoCell(
                title: "Transaction number",
                value: transaction.number
            )
            TransactionInfoCell(
                title: "Date",
                value: transaction.getFormattedDate
            )
            TransactionInfoCell(
                title: "Transaction status",
                value: transaction.status.rawValue
            )
            TransactionInfoCell(
                title: "Amount",
                value: transaction.getFormattedAmount
            )
            .padding(.bottom, 32)
            
            CustomButtonView(title: "Okay") {
                dismiss()
            }
            
            Spacer()
        }
    }
    
    @ViewBuilder
    private func TransactionInfoCell(title: String, value: String) -> some View {
        
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
    TransactionDetailsView(
        transaction: RecentTransactionsProvider.getRecentTransactions().first!
    )
}
