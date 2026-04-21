//
//  ContentView.swift
//  iExpense
//
//  Created by Edwin Cardenas on 4/20/26.
//

import SwiftUI

struct SecondView: View {
    let name: String
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            Text("Hello, @\(name)")

            Button("Dismiss") {
                dismiss()
            }
            .buttonStyle(.bordered)
        }
    }
}

struct ContentView: View {
    @State private var showingSheet = false

    var body: some View {
        Button("Show sheet") {
            showingSheet.toggle()
        }
        .buttonStyle(.bordered)
        .sheet(isPresented: $showingSheet) {
            SecondView(name: "eacardenase")
        }
    }
}

#Preview {
    ContentView()
}
