//
//  CustomButton.swift
//  CIBPay textField
//
//  Created by Atheer Othman on 27/03/1445 AH.
//

import UIKit

class CustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 3
        self.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
  
    func filledStyleButton(title: String){
        self.setTitle(title, for: .normal)
        self.backgroundColor = .blue
        self.setTitleColor(.white, for: .normal)
//        self.layer.cornerRadius = 1
        
    }
    
    func borderStyledButton(title: String){
        self.setTitle(title, for: .normal)
        self.backgroundColor = .white
        self.setTitleColor(.blue, for: .normal)
//        self.layer.cornerRadius = 1
        self.layer.borderColor = UIColor.blue.cgColor
        self.layer.borderWidth = 1
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
