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
                
                Text(transaction.getFormattedDate)
                    .foregroundStyle(.secondaryText)
                
                Text(transaction.status.rawValue)
                    .foregroundStyle(transaction.status.getColor)
            }
            
            Spacer()
            
            HStack {
                Text(transaction.getFormattedAmount)
                    .foregroundStyle(.white)
                    .fontWeight(.semibold)
                
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
