//
//  LoginView.swift
//  ValidationLearning
//
//  Created by Jaydip Gadhiya on 05/03/26.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var showError: Bool = false
    
    
    var isValidEmail: Bool {
        return !email.isEmpty && !password.isEmpty && email.isValidEmail
    }
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            Label("Login", systemImage: "")
                .font(.title)
                .fontDesign(.rounded)
                .fontWeight(.semibold)
            
            TextField("Email", text: $email)
                .padding(.vertical, 12)   // increases height
                .padding(.horizontal, 16)
                .textInputAutocapitalization(.never)
                .fontDesign(.rounded)
                .fontWeight(.semibold)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1.5)
                )
            
            if showError && email.isEmpty {
                Text("Email is required!")
                    .foregroundStyle(.red)
                    .font(.footnote)
            }
            
            SecureField("Password", text: $password)
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
                .fontDesign(.rounded)
                .fontWeight(.semibold)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1.5)
                )
            
            if showError && password.isEmpty {
                Text("Password is required!")
                    .foregroundStyle(.red)
                    .font(.footnote)
            }
        }
        .padding()
        
        VStack {
            Button("Login") {
                if isValidEmail {
                    // API calling
                } else {
                    showError = true
                }
            }
            .fontDesign(.monospaced)
            .fontWeight(.semibold)
            .frame(width: 100.0, height: 44.0)
            .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                    .stroke(isValidEmail ? Color.blue : Color.gray, lineWidth: 2.0)
            )
        }
        
    }
    
}

#Preview {
    LoginView()
}
