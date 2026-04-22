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
    @State private var showingAddExpense = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses.items) { item in
                    Text(item.name)
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                EditButton()

                Button("Add Expense", systemImage: "plus") {
                    showingAddExpense = true
                }
            }
        }
        .sheet(isPresented: $showingAddExpense) {
            AddExpenseView(expenses: expenses)
        }
    }

    func removeItems(at offset: IndexSet) {
        expenses.items.remove(atOffsets: offset)
    }
}

#Preview {
    ContentView()
}
