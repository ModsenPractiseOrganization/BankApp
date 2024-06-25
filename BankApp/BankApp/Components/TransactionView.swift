//
//  TransactionView.swift
//  BankApp
//
//  Created by Paul Makey on 25.06.24.
//

import SwiftUI

struct TransactionView: View {
    let transaction: Transaction
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        return formatter
    }()
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(transaction.company)
                    .foregroundStyle(.white)
                    .font(.title3)
                    .fontWeight(.bold)
                
                Text(dateFormatter.string(from: transaction.date))
                    .foregroundStyle(.secondaryText)
                
                Text(transaction.status.rawValue)
                    .foregroundStyle(transaction.status.getColor)
            }
            
            Spacer()
            
            HStack {
                Text(String(format: "%.2f", transaction.amount))
                    .foregroundStyle(.white)
                
                Image("chevron.forward.dark")
            }
        }
    }
}

#Preview {
    TransactionView(
        transaction: RecentTransactionsProvider.getRecentTransactions().first!
    )
}
