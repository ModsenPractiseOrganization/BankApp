//
//  ContentView.swift
//  BankApp
//
//  Created by Jaxyk on 26.06.24.
//

import SwiftUI

struct DateRangePickerView: View {
    @EnvironmentObject private var viewModel: DateRangePickerViewModel
    
    @Binding var startDate: Date?
    @Binding var endDate: Date?
    
    var onDone: () -> Void
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                largeTitle()
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Start date")
                        .foregroundColor(.white)
                    
                    Button{
                        viewModel.showStartDatePicker.toggle()
                    } label: {
                        dateField(date: startDate)
                    }
                    .sheet(isPresented: $viewModel.showStartDatePicker) {
                        datePickerSheet()
                    }
                }
                .padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("End date")
                        .foregroundColor(.white)
                    
                    Button {
                        viewModel.showEndDatePicker.toggle()
                    } label: {
                        dateField(date: endDate)
                    }
                    .sheet(isPresented: $viewModel.showEndDatePicker) {
                        datePickerSheet()
                    }
                }
                .padding(.horizontal)
                
                Button {
                    viewModel.shouldShowError(
                        startDate: startDate,
                        endDate: endDate
                    )
                    if viewModel.isEnteredDateValid(startDate: startDate, endDate: endDate) {
                        onDone()
                    }
                } label: {
                    Text("Submit")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            viewModel.getBackgroundColor(
                                startDate: startDate,
                                endDate: endDate
                            )
                        )
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
            }
            .padding()
            .presentationDetents([.fraction(0.4)])
            .edgesIgnoringSafeArea(.all)
        }
    }
    
    @ViewBuilder
    func largeTitle() -> some View {
        Text("Filter by date")
            .font(.largeTitle)
            .bold()
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
    }
    
    @ViewBuilder
    func dateField(date: Date?) -> some View {
        HStack {
            Text(date != nil ? DateFormatter.displayDate.string(from: date!) : "Select start date")
                .foregroundColor(.white)
            
            Spacer()
            
            Image(systemName: "calendar")
                .foregroundColor(.white)
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(viewModel.showStartDateError ? Color.red : Color.clear, lineWidth: 2)
        )
    }
    
    @ViewBuilder
    func datePickerSheet() -> some View {
        DatePicker("Select start date", selection: Binding(get: {
            startDate ?? Date()
        }, set: { newValue in
            startDate = newValue
            viewModel.showStartDateError = false
        }), displayedComponents: .date)
        .datePickerStyle(GraphicalDatePickerStyle())
        .padding()
        .background(Color.black)
        .presentationDetents([.fraction(0.45)])
        .edgesIgnoringSafeArea(.all)
    }
}

