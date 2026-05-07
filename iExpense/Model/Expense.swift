//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Edwin Cardenas on 4/22/26.
//

import Foundation
import SwiftData

@Model
class Expense {
    var name: String
    var type: String
    var amount: Double = 0

    var isValidExpense: Bool {
        return !name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

    init(name: String, type: String, amount: Double) {
        self.name = name
        self.type = type
        self.amount = amount
    }
}
