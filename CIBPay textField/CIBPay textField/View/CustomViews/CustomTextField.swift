//
//  CustomTextField.swift
//  CIBPay textField
//
//  Created by Atheer Othman on 26/03/1445 AH.
//

import UIKit
import MaterialComponents

class CustomTextField: UITextField {
    
    let insets: UIEdgeInsets
    
    init(insets: UIEdgeInsets =  UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)){
        self.insets = insets
        super.init(frame: .zero)
        backgroundColor = .white
        layer.cornerRadius = 3
        layer.borderWidth = 1
        layer.borderColor = UIColor.gray.cgColor
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: insets)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: insets)
    }
}


// MARK: -  MaterialComponents Text Field

//class NewCustomeTextField: MDCTextInputControllerOutlined{
//    
//}
