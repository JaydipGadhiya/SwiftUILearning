//
//  ExpenseCategory+CoreDataClass.swift
//  CoraDataLearning
//
//  Created by Jaydip Gadhiya on 16/03/26.
//

import Foundation
internal import CoreData

@objc(ExpenseCategory)
class ExpenseCategory: NSManagedObject {
    
    public override func awakeFromInsert() {
        self.dateCreated = Date()
    }
    
}
