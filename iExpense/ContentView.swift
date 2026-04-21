//
//  ContentView.swift
//  iExpense
//
//  Created by Edwin Cardenas on 4/20/26.
//

import SwiftUI

struct ContentView: View {
    // @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    @State private var tapCount: Int = {
        guard
            let count = UserDefaults.standard.value(forKey: "Tap") as? Int
        else {
            return 0
        }

        return count
    }()

    var body: some View {
        Button("Tap count: \(tapCount)") {
            tapCount += 1

            UserDefaults.standard.set(tapCount, forKey: "Tap")
        }
    }
}

#Preview {
    ContentView()
}
