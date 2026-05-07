//
//  iExpenseApp.swift
//  iExpense
//
//  Created by Edwin Cardenas on 4/20/26.
//

import SwiftData
import SwiftUI

@main
struct iExpenseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Expense.self)
    }
}
