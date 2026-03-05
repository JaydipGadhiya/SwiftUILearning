//
//  String+Extensions.swift
//  ValidationLearning
//
//  Created by Jaydip Gadhiya on 05/03/26.
//

import Foundation

extension String {
    
    var isValidEmail: Bool {
        let emailRegexExpression = "^(([^<>()\\[\\]\\\\.,;:\\s@“]+(\\.[^<>()\\[\\]\\\\.,;:\\s@“]+)*)|(“.+“))@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegexExpression)
        return emailPredicate.evaluate(with: self)
    }
}
