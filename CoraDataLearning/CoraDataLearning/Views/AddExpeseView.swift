//
//  AddExpeseView.swift
//  CoraDataLearning
//
//  Created by Jaydip Gadhiya on 16/03/26.
//

import SwiftUI
internal import CoreData

struct AddExpeseView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss
    @State private var title: String = ""
    @State private var price: String = ""
    @State private var type: Int = 0
    @State private var messages: [String] = []
    
    var isFormValid: Bool {
        
        messages.removeAll()
        
        if title.isEmpty {
            messages.append("Title is required!")
        }
        
        if Int(price) ?? 0 <= 0 {
            messages.append("Price should greater than 1")
        }
        
        return messages.count == 0
    }
    
    private func performSave() {
        let expense = ExpenseCategory(context: viewContext)
        expense.name = title
        expense.price = Double(price) ?? 0.0
        expense.type = type == 0 ? "Wallet" : "Bank"
        
        do {
            try viewContext.save()
        } catch {
            print("Error ::::: \(error.localizedDescription)")
        }
    }
    
    var body: some View {
        Form {
            TextField(text: $title) {
                Text("Title")
            }
            
            TextField(text: $price) {
                Text("Price")
            }
            .keyboardType(.numberPad)
            
            Picker("Expense Type", selection: $type) {
                Text("Wallet").tag(0)
                    .fontWeight(.semibold)
                Text("Bank").tag(1)
                    .fontWeight(.semibold)
            }
            .pickerStyle(.segmented)
            
            HStack {
                Spacer()
                Button("Add Expense") {
                    if isFormValid {
                        performSave()
                        dismiss()
                    }
                }
                Spacer()
            }
            
            ForEach(messages, id: \.self) { message in
                Text(message)
            }
        }
    }
}

#Preview {
    AddExpeseView()
}
