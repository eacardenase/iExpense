//
//  ContentView.swift
//  iExpense
//
//  Created by Edwin Cardenas on 4/20/26.
//

import SwiftUI

@Observable
class Expenses {
    var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }

    init() {
        if let itemsData = UserDefaults.standard.data(forKey: "Items"),
            let loadedItems = try? JSONDecoder().decode(
                [ExpenseItem].self,
                from: itemsData
            )
        {
            items = loadedItems
        }
    }
}

struct ContentView: View {
    @State private var expenses = Expenses()

    var body: some View {
        NavigationStack {
            List {
                Section {
                    NavigationLink {
                        AddExpenseView(expenses: expenses)
                    } label: {
                        Label("Add expense", systemImage: "plus")
                    }
                }

                ForEach(expenses.items) { item in
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
            .navigationTitle("iExpense")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    EditButton()
                }
            }
        }
    }

    func removeItems(at offset: IndexSet) {
        expenses.items.remove(atOffsets: offset)
    }
}

#Preview {
    ContentView()
}
