//
//  TextFieldTableViewCell.swift
//  CIBPay textField
//
//  Created by Atheer Othman on 26/03/1445 AH.
//

import UIKit

class TextFieldTableViewCell: UITableViewCell, TextFieldFormateDelegate {
   

    lazy var usernameTextField: CustomTextField = {
        let tf = CustomTextField()
        tf.placeholder = "Username"
        return tf
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupInterface()
    }
    
    func setupInterface(){
        contentView.addSubview(usernameTextField)
        backgroundColor = .clear
        selectionStyle = .none
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
            usernameTextField.heightAnchor.constraint(equalToConstant: 60),
            
            usernameTextField.leftAnchor.constraint(equalTo:  leftAnchor, constant: 16),
            usernameTextField.rightAnchor.constraint(equalTo:  rightAnchor, constant: -16)
        ])
     }
    
    func format(text: String) {
        <#code#>
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
