//
//  ContentView.swift
//  iExpense
//
//  Created by Edwin Cardenas on 4/20/26.
//

import SwiftUI

@Observable
class Expenses: Codable {
    var items = [ExpenseItem]()
}

struct ContentView: View {
    @State private var expenses = Expenses()

    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses.items, id: \.name) { item in
                    Text(item.name)
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                EditButton()

                Button("Add", systemImage: "plus") {
                    let item = ExpenseItem(
                        name: "Test",
                        type: "Test",
                        amount: 200
                    )

                    withAnimation {
                        expenses.items.append(item)
                    }
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
