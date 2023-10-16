//
//  UsernameFormat.swift
//  CIBPay textField
//
//  Created by Atheer Othman on 27/03/1445 AH.
//

import Foundation


struct TextFormat {
    let format: String
//    let icon: String
}

var usernameFormats: [TextFormat] = [
    TextFormat(format: "Maximum length should be 30 characters"),
    TextFormat(format: "Minimum length should be 6 characters"),
    TextFormat(format: "Special characters not allowed. (#, %, &, ^, !)"),
    TextFormat(format: "Spaces is not allowed."),
    TextFormat(format: "Alphanumeric (xshi193)")
]

