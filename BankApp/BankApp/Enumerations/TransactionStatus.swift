//
//  TransactionStatus.swift
//  BankApp
//
//  Created by Paul Makey on 25.06.24.
//

import SwiftUI

enum TransactionStatus: String {
    case executed = "Executed"
    case declined = "Declined"
    case inProgress = "In progress"
    
    var getColor: Color {
        switch self {
            case .executed:
                .green
            case .declined:
                .red
            case .inProgress:
                .yellow
        }
    }
}
