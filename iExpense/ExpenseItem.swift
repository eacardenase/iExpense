//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Edwin Cardenas on 4/22/26.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
