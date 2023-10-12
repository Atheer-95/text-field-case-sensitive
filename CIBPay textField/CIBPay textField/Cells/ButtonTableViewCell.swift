//
//  ButtonTableViewCell.swift
//  CIBPay textField
//
//  Created by Atheer Othman on 26/03/1445 AH.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {
    
    lazy var button: UIButton = {
        let btn = UIButton()
        return btn
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupButton()
    }
    
   
    func setupButton(){
        contentView.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            button.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            button.rightAnchor.constraint(equalTo: rightAnchor, constant: 16),
            button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 12)
        ])
    }
    
    func buttonFilledStyle(){
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
