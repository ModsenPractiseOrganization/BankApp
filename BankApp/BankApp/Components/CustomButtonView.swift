//
//  CustomButtonView.swift
//  BankApp
//
//  Created by Paul Makey on 26.06.24.
//

import SwiftUI

struct CustomButtonView: View {
    let title: String
    let action: () -> ()
    
    var body: some View {
        VStack {
            Button {
                action()
            } label: {
                Text(title)
                    .foregroundStyle(.white)
                    .font(.title3)
                    .fontWeight(.black)
            }
            .padding()
            .frame(width: UIScreen.main.bounds.width - 8)
            .background {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundStyle(.milkBlue)
            }
        }
    }
}
