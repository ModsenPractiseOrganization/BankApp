//
//  Extension + DateFormatter.swift
//  BankApp
//
//  Created by Paul Makey on 28.06.24.
//

import Foundation

extension DateFormatter {
    static let displayDate: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.YYYY"
        return formatter
    }()
}
