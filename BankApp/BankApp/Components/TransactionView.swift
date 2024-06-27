//
//  TransactionView.swift
//  BankApp
//
//  Created by Paul Makey on 25.06.24.
//

import SwiftUI

struct TransactionView: View {
    let transaction: Transaction
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(transaction.company)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                
                Text(transaction.getFormattedDate)
                    .foregroundStyle(.secondaryText)
                
                Text(transaction.status.rawValue)
                    .foregroundStyle(transaction.status.getColor)
            }
            
            Spacer()
            
            HStack {
                SecondaryText(text: transaction.getFormattedDate)
                
                Image("chevron.forward.dark")
            }
        }
    }
}

#Preview {
    TransactionView(
        transaction: TransactionsProvider.getTransactions().first!
    )
}
