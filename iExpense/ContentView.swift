//
//  ContentView.swift
//  iExpense
//
//  Created by Edwin Cardenas on 4/20/26.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @State private var path = [Expense]()
    @State private var sortOrder = [
        SortDescriptor(\Expense.name),
        SortDescriptor(\Expense.amount),
    ]

    var body: some View {
        NavigationStack(path: $path) {
            ExpensesView()
                .navigationTitle("iExpense")
                .navigationDestination(for: Expense.self) { expense in
                    AddExpenseView(expense: expense)
                }
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        EditButton()
                    }

                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Add Expense", systemImage: "plus") {
                            let expense = Expense(
                                name: "",
                                type: "Personal",
                                amount: 0.0
                            )

                            modelContext.insert(expense)

                            path = [expense]
                        }
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
