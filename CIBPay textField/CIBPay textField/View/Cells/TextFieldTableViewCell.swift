//
//  TextFieldTableViewCell.swift
//  CIBPay textField
//
//  Created by Atheer Othman on 26/03/1445 AH.
//

import UIKit
import MaterialComponents

class TextFieldTableViewCell: UITableViewCell {
   

    
    var formatDelegate: TextFieldFormateDelegate?
    
    lazy var usernameTextField:MDCOutlinedTextField = {
        let tf = MDCOutlinedTextField(frame:CGRect(x: 0, y: 0, width: CGFloat(self.frame.width - 16), height: 40) )
        tf.label.text = "Username"
        tf.placeholder = "Username"
        tf.setOutlineColor(CIBColor.backgroundBlue, for: .editing)
        tf.setFloatingLabelColor(CIBColor.backgroundBlue, for: .editing)
        tf.leadingAssistiveLabel.text = "This is helper text"
        tf.sizeToFit()
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
        usernameTextField.delegate = self
        
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
            usernameTextField.heightAnchor.constraint(equalToConstant: 60),
            
            usernameTextField.leftAnchor.constraint(equalTo:  leftAnchor, constant: 16),
            usernameTextField.rightAnchor.constraint(equalTo:  rightAnchor, constant: -16)
        ])
     }
  
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


// MARK: -  TextField Delegate

extension TextFieldTableViewCell: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Username : \(textField.text ?? "nil" )")
        self.formatDelegate?.format(text: textField.text!)
    
        return true
    }
//    
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        self.formatDelegate?.format(text: textField.text!)
//    }
//    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // get the current text, or use an empty string if that failed
        let currentText = textField.text ?? ""

        // attempt to read the range they are trying to change, or exit if we can't
        guard let stringRange = Range(range, in: currentText) else { return false }

        // add their new text to the existing text
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)

        self.formatDelegate?.format(text: updatedText)
        // make sure the result is under 30 characters
        return updatedText.count <= 30
        
        
    }
    
    @objc func valueChanged(_ textField: UITextField){
       
    }
}
