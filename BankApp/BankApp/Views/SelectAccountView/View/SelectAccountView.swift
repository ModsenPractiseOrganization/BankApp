//
//  SelectAccountView.swift
//  BankApp
//
//  Created by Paul Makey on 27.06.24.
//

import SwiftUI

struct SelectAccountView: View {
    @EnvironmentObject private var viewModel: SelectAccountViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            largeTitle("Select the account")
                .padding(.top, 20)
            
            ForEach(viewModel.accounts) { account in
                CurrentAccountViewCell(
                    currentAccount: account,
                    backgroundColor: viewModel.setBackgroundColor(forAccount: account)
                )
                .onTapGesture {
                    viewModel.setNewAccountValue(account)
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
    
    @ViewBuilder
    func largeTitle(_ title: String) -> some View {
        HStack {
            Text("Select the account")
                .foregroundStyle(.white)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.leading, 6)
            
            Spacer()
        }
    }
}

#Preview {
    SelectAccountView()
}
