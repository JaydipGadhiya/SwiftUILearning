//
//  HomeView.swift
//  CoraDataLearning
//
//  Created by Jaydip Gadhiya on 13/03/26.
//

import SwiftUI
internal import CoreData

struct HomeView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: []) private var expenseResults: FetchedResults<ExpenseCategory>
    @State private var isPresented: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenseResults) { expense in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(expense.name ?? "")
                                .font(.headline)
                            
                            Text(expense.dateCreated?.string(withFormat: "dd MMM, YYYY") ?? "")
                                .font(.footnote)
                                .fontWeight(.semibold)
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .trailing) {
                            Text("₹ \(Int(expense.price))")
                                .font(.footnote)
                                .fontWeight(.semibold)
                            
                            Text(expense.type ?? "")
                                .font(.footnote)
                        }
                    }
                }
                .onDelete(perform: deleteExpense)
            }
            .navigationTitle("Expenses")
            
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Expense") {
                        isPresented = true
                    }
                    .fontWeight(.semibold)
                }
            }
            
            .sheet(isPresented: $isPresented) {
                AddExpeseView()
            }
        }
    }
    
    private func deleteExpense(at offsets: IndexSet) {
        offsets.map { expenseResults[$0] }.forEach(viewContext.delete)
        
        do {
            try viewContext.save()
        } catch {
            print("Failed to delete expense")
        }
    }
}

#Preview {
    HomeView()
}
