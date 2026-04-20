//
//  ContentView.swift
//  iExpense
//
//  Created by Edwin Cardenas on 4/20/26.
//

import SwiftUI

@Observable
class User {
    var firstName = "Bilbo"
    var lastName = "Baggins"
}

struct ContentView: View {
    @State private var user = User()

    var body: some View {
        Form {
            Section {
                Text("Your name is: \(user.firstName)  \(user.lastName)")
            }

            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
        }
    }
}

#Preview {
    ContentView()
}
