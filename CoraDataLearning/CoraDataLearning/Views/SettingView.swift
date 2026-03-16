//
//  SettingView.swift
//  CoraDataLearning
//
//  Created by Jaydip Gadhiya on 13/03/26.
//

import SwiftUI
internal import CoreData

struct SettingView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State private var showAlert: Bool = false
    
    private func clearAllExpenses() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = ExpenseCategory.fetchRequest()
            let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
            deleteRequest.resultType = .resultTypeObjectIDs
            do {
                let result = try viewContext.execute(deleteRequest) as? NSBatchDeleteResult
                if let objectIDs = result?.result as? [NSManagedObjectID] {
                    let changes = [NSDeletedObjectsKey: objectIDs]
                    NSManagedObjectContext.mergeChanges(fromRemoteContextSave: changes, into: [viewContext])
                }
            } catch {
                print("Delete failed \(error)")
            }
    }
    
    
    var body: some View {
        Form {
            Button("Clear Expense") {
                showAlert = true
            }
            .foregroundStyle(.red)
            .alert("Delete All Expenses?", isPresented: $showAlert) {
                Button("Delete", role: .destructive) {
                    clearAllExpenses()
                }
                
                Button("Cancel", role: .cancel) { }
            }
            Text("Project created for learning purpose")
        }
    }
}

#Preview {
    SettingView()
}
