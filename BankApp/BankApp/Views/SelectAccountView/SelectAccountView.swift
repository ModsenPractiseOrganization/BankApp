//
//  SelectAccountView.swift
//  BankApp
//
//  Created by Paul Makey on 27.06.24.
//

import SwiftUI

struct SelectAccountView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @Binding var currentAccount: Account?
    
    let accounts: [Account]
    
    var body: some View {
        VStack {
            HStack {
                Text("Select the account")
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.leading, 6)
                
                Spacer()
            }
            .padding(.top, 20)
            
            ForEach(accounts) { account in
                CurrentAccountViewCell(
                    currentAccount: account,
                    backgroundColor: currentAccount?.id == account.id ? .selection : .viewBackground
                )
                .onTapGesture {
                    currentAccount = account
                    dismiss()
                }
            }
            .padding(.vertical, 6)
            
            Divider()
            
            CustomButtonView(title: "Submit") {
                dismiss()
            }
            .padding(.top, 6)
            .padding(.bottom, 40)
            
            Spacer()
        }
    }
}

#Preview {
    SelectAccountView(
        currentAccount: .constant(AccountsProvider.getAccounts().first!),
        accounts: AccountsProvider.getAccounts()
    )
}
