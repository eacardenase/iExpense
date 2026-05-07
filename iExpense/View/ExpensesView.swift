//
//  ExpensesView.swift
//  iExpense
//
//  Created by Edwin Cardenas on 5/7/26.
//

import SwiftData
import SwiftUI

struct ExpensesView: View {
    @Environment(\.modelContext) var modelContext
    @Query var expenses: [Expense]

    var body: some View {
        List {
            ForEach(expenses) { item in
                HStack {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(item.name)
                            .font(.headline)

                        Text(item.type)
                            .font(.subheadline)
                    }

                    Spacer()

                    Text(
                        item.amount.formatted(
                            .currency(
                                code: Locale.current.currency?.identifier
                                    ?? "USD"
                            )
                        )
                    )
                }
            }
            .onDelete(perform: removeItems)
        }
    }

    func removeItems(at offsets: IndexSet) {
        for offset in offsets {
            let expense = expenses[offset]

            modelContext.delete(expense)
        }
    }
}

#Preview {
    ExpensesView()
        .modelContainer(for: Expense.self)
}
