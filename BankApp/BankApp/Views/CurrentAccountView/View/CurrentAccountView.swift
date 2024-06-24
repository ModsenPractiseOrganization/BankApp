//
//  CurrentAccountView.swift
//  BankApp
//
//  Created by Paul Makey on 25.06.24.
//

import SwiftUI

struct CurrentAccountView: View {
    
    @State private var currentAccount = AccountsProvider.getAccounts().first
    private let accounts = AccountsProvider.getAccounts()
    
    
    var body: some View {
        
        NavigationStack {
            VStack {
                List {
                    HStack() {
                        
                        Image("cardImage")
                            .resizable()
                            .frame(width: 40, height: 25)
                            .padding(.top, -30)
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text(currentAccount?.name ?? "")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                            
                            Text(currentAccount?.number ?? "")
                                .fontWeight(.semibold)
                                .font(.subheadline)
                                .foregroundStyle(.secondaryText)
                            
                            Text(currentAccount?.pin ?? "")
                                .fontWeight(.semibold)
                                .font(.subheadline)
                                .foregroundStyle(.secondaryText)
                        }
                        .padding([.top, .bottom], 8)
                    }
                }
            }
            .navigationTitle("Account")
        }
    }
}

#Preview {
    CurrentAccountView()
}
