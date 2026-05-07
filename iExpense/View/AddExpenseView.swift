//
//  AddExpenseView.swift
//  iExpense
//
//  Created by Edwin Cardenas on 4/22/26.
//

import SwiftData
import SwiftUI

struct AddExpenseView: View {
    let types = ["Business", "Personal"]

    @Bindable var expense: Expense
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss

    var body: some View {
        Form {
            TextField("Name", text: $expense.name)

            Picker("Type", selection: $expense.type) {
                ForEach(types, id: \.self) {
                    Text($0)
                }
            }

            TextField(
                "Amount",
                value: $expense.amount,
                format: .currency(
                    code: Locale.current.currency?.identifier ?? "USD"
                )
            )
            .keyboardType(.decimalPad)
        }
        .navigationTitle("Add Expense")
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button(role: .close) {
                    modelContext.delete(expense)

                    dismiss()
                }
            }

            ToolbarItem(placement: .confirmationAction) {
                Button(role: .confirm) {
                    dismiss()
                }
                .disabled(!expense.isValidExpense)
            }
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(
            for: Expense.self,
            configurations: config
        )
        let expense = Expense(
            name: "Udemy course",
            type: "Personal",
            amount: 9.99
        )

        return AddExpenseView(expense: expense)
            .modelContainer(container)
    } catch {
        return Text(
            "Failed to create container with error: \(error.localizedDescription)"
        )
    }
}
