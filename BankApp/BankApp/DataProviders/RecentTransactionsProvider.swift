//
//  RecentTransactionsProvider.swift
//  BankApp
//
//  Created by Paul Makey on 25.06.24.
//

import Foundation

struct RecentTransactionsProvider {
    static func getRecentTransactions() -> [Transaction] {
        [
            Transaction(
                company: #"OOO "Company1""#,
                number: "f4345jfshjek3454",
                date: Date(),
                status: .executed,
                amount: 10.09
            ),
            Transaction(
                company: #"OOO "Company2""#,
                number: "f4345jfshjek3454",
                date: Date(),
                status: .declined,
                amount: 10.09
            ),
            Transaction(
                company: #"OOO "Company3""#,
                number: "f4345jfshjek3454",
                date: Date(),
                status: .inProgress,
                amount: 10.09
            ),
            Transaction(
                company: #"OOO "Company4""#,
                number: "f4345jfshjek3454",
                date: Date(),
                status: .executed,
                amount: 10.09
            ),
            Transaction(
                company: #"OOO "Company5""#,
                number: "f4345jfshjek3454",
                date: Date(),
                status: .executed,
                amount: 10.09
            ),
            Transaction(
                company: #"OOO "Company6""#,
                number: "f4345jfshjek3454",
                date: Date(),
                status: .executed,
                amount: 10.09
            ),
            Transaction(
                company: #"OOO "Company7""#,
                number: "f4345jfshjek3454",
                date: Date(),
                status: .executed,
                amount: 10.09
            )
        ]
    }
}
