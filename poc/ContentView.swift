//
//  ContentView.swift
//  poc
//
//  Created by Fransiskus Andika Setiawan on 11/06/25.
//

import SwiftUI

struct ContentView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var welcomeMessage: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            
            Text("POC Test use XCUITest")
                .font(.headline)
                .fontWeight(.bold)
            
            TextField("Username", text: $username)
                .accessibilityIdentifier("fieldUsername")
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
            
            SecureField("Password", text: $password)
                .accessibilityIdentifier("fieldPassword")
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
            
            Button("Login") {
                if username.lowercased() == "dika" && password == "password123" {
                    welcomeMessage = "Welcome bro \(username)!"
                } else {
                    welcomeMessage = "You not my bro \(username)!"
                }
            }
            .accessibilityIdentifier("btnLogin")
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
            
            if welcomeMessage.contains("Welcome bro") {
                Text(welcomeMessage)
                    .accessibilityIdentifier("txtWelcomeMessage")
                    .padding()
            } else {
                Text(welcomeMessage)
                    .accessibilityIdentifier("txtWelcomeMessage")
                    .padding()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
