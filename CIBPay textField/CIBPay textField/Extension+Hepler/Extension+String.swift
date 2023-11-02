//
//  Extension+String.swift
//  CIBPay textField
//
//  Created by Atheer Othman on 02/04/1445 AH.
//

import Foundation

extension String {
    // check if the string has space and newlines
    func containsWhitespaceAndNewlines() -> Bool {
           return rangeOfCharacter(from: .whitespacesAndNewlines) != nil
       }
}
