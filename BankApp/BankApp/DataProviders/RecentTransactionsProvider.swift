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
                id: 0,
                company: #"OOO "Company1""#,
                number: "f4345jfshjek3454",
                date: Date(),
                status: .executed,
                amount: 10.09
            ),
            Transaction(
                id: 1,
                company: #"OOO "Company2""#,
                number: "f4345jfshjek3454",
                date: Date(),
                status: .declined,
                amount: 10.09
            ),
            Transaction(
                id: 2,
                company: #"OOO "Company3""#,
                number: "f4345jfshjek3454",
                date: Date(),
                status: .inProgress,
                amount: 10.09
            ),
            Transaction(
                id: 3,
                company: #"OOO "Company4""#,
                number: "f4345jfshjek3454",
                date: Date(),
                status: .executed,
                amount: 10.09
            ),
            Transaction(
                id: 4,
                company: #"OOO "Company5""#,
                number: "f4345jfshjek3454",
                date: Date(),
                status: .executed,
                amount: 10.09
            ),
            Transaction(
                id: 5,
                company: #"OOO "Company6""#,
                number: "f4345jfshjek3454",
                date: Date(),
                status: .executed,
                amount: 10.09
            ),
            Transaction(
                id: 6,
                company: #"OOO "Company7""#,
                number: "f4345jfshjek3454",
                date: Date(),
                status: .executed,
                amount: 10.09
            )
        ]
    }
}
