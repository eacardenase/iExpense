//
//  AddExpenseView.swift
//  iExpense
//
//  Created by Edwin Cardenas on 4/22/26.
//

import SwiftUI

struct AddExpenseView: View {
    var expenses: Expenses
    let types = ["Business", "Personal"]

    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    @Environment(\.dismiss) var dismiss

    var disableForm: Bool {
        name.isEmpty || name.count < 5
    }

    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)

                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }

                TextField(
                    "Amount",
                    value: $amount,
                    format: .currency(
                        code: Locale.current.currency?.identifier ?? "USD"
                    )
                )
                .keyboardType(.decimalPad)
            }
            .navigationTitle("Add Expense")
            .toolbar {
                ToolbarItem {
                    Button("Save", role: .confirm) {
                        let expenseItem = ExpenseItem(
                            name: name,
                            type: type,
                            amount: amount
                        )

                        expenses.items.append(expenseItem)

                        dismiss()
                    }
                    .disabled(disableForm)
                }

                ToolbarItem {
                    Button(role: .close) {
                        dismiss()
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    AddExpenseView(expenses: Expenses())
}
