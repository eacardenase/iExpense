//
//  ContentView.swift
//  iExpense
//
//  Created by Edwin Cardenas on 4/20/26.
//

import SwiftUI

struct User: Codable {
    var firstName = ""
    var lastName = ""
}

struct ContentView: View {
    @State private var user: User = {
        guard
            let userData = UserDefaults.standard.data(forKey: "UserData")
        else { return User() }

        let decoder = JSONDecoder()
        if let user = try? decoder.decode(User.self, from: userData) {
            return user
        }

        return User()
    }()

    var body: some View {
        NavigationStack {
            List {
                Text("Your name is: \(user.firstName) \(user.lastName)")

                Section {
                    TextField("First name", text: $user.firstName)
                    TextField("Last name", text: $user.lastName)
                }
            }
            .navigationTitle("Me")
            .toolbar {
                Button {
                    let encoder = JSONEncoder()

                    if let data = try? encoder.encode(user) {
                        UserDefaults.standard.set(data, forKey: "UserData")
                    }
                } label: {
                    Label("Save", systemImage: "square.and.arrow.down")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
