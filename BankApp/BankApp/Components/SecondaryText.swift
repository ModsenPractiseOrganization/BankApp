//
//  SecondaryText.swift
//  BankApp
//
//  Created by Paul Makey on 28.06.24.
//

import SwiftUI

struct SecondaryText: View {
    let text: String
    
    var body: some View {
        Text(text)
            .fontWeight(.semibold)
            .font(.subheadline)
            .foregroundStyle(.secondaryText)
    }
}
