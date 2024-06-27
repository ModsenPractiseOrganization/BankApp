//
//  CurrentAccountViewCell.swift
//  BankApp
//
//  Created by Paul Makey on 25.06.24.
//

import SwiftUI

struct CurrentAccountViewCell: View {
    let currentAccount: Account
    var backgroundColor: Color = .viewBackground
    
    var body: some View {
        HStack {
            Image("cardImage")
                .resizable()
                .frame(width: 40, height: 25)
                .padding(.top, -35)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(currentAccount.name)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                
                Text(currentAccount.number)
                    .fontWeight(.semibold)
                    .font(.subheadline)
                    .foregroundStyle(.secondaryText)
                
                Text(currentAccount.hiddenPin)
                    .fontWeight(.semibold)
                    .font(.subheadline)
                    .foregroundStyle(.secondaryText)
            }
            .padding([.top, .bottom], 5)
            
            Spacer()
            
            Image("chevron.forward")
        }
        .padding()
        .frame(width: UIScreen.main.bounds.width - 8)
        .background {
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(backgroundColor)
        }
    }
}

#Preview {
    CurrentAccountView()
}
