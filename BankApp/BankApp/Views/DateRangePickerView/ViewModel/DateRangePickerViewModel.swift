//
//  DateRangePickerViewModel.swift
//  BankApp
//
//  Created by Paul Makey on 28.06.24.
//

import Foundation
import SwiftUI

final class DateRangePickerViewModel: ObservableObject {
    @Published var showStartDatePicker = false
    @Published var showEndDatePicker = false
    @Published var showStartDateError = false
    @Published var showEndDateError = false
    
    func isEnteredDateValid(startDate: Date?, endDate: Date?) -> Bool {
        startDate != nil && endDate != nil && startDate! <= endDate!
    }
    
    func getBackgroundColor(startDate: Date?, endDate: Date?) -> Color {
        isEnteredDateValid(startDate: startDate, endDate: endDate)
        ? .blue
        : .gray
    }
    
    func shouldShowError(startDate: Date?, endDate: Date?) {
        if startDate == nil {
            showStartDateError = true
        }
        if endDate == nil {
            showEndDateError = true
        }
    }
}
