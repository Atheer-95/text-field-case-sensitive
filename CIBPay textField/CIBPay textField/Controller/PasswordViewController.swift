//
//  PasswordViewController.swift
//  CIBPay textField
//
//  Created by Atheer Othman on 25/03/1445 AH.
//

import UIKit
import MaterialComponents

class PasswordViewController: UIViewController {

//    lazy var  passwordTextField1: CustomTextField = {
//        let tf = CustomTextField()
//        tf.placeholder = "Enter Password"
//        return tf
//    }()
//    
    lazy var  passwordTextField1: MDCOutlinedTextField = {
        let tf = MDCOutlinedTextField(frame:CGRect(x: 0, y: 0, width: CGFloat(view.frame.width - 16), height: 40) )
        
        tf.label.text = "Enter Password"
        tf.placeholder = "********"
        tf.setOutlineColor(CIBColor.backgroundBlue, for: .editing)
        tf.setFloatingLabelColor(CIBColor.backgroundBlue, for: .editing)
        tf.leadingAssistiveLabel.text = "This is helper text"
        tf.isSecureTextEntry = true
        tf.sizeToFit()
        return tf
    }()
    
    lazy var  passwordTextField2: MDCOutlinedTextField = {
        let tf = MDCOutlinedTextField(frame:CGRect(x: 0, y: 0, width: CGFloat(view.frame.width - 16), height: 40) )
        
        tf.label.text = "Confirm Password"
        tf.placeholder = "*******"
        tf.isSecureTextEntry = true
        tf.leadingAssistiveLabel.text = "This is helper text"
        tf.setOutlineColor(CIBColor.backgroundBlue, for: .editing)
        tf.setFloatingLabelColor(CIBColor.backgroundBlue, for: .editing)
        tf.sizeToFit()
        return tf
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextField()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
    }
  
   func setTextField(){
       
       view.addSubview(passwordTextField1)
       view.addSubview(passwordTextField2)
       passwordTextField1.delegate = self
       passwordTextField2.delegate = self
       
       passwordTextField1.translatesAutoresizingMaskIntoConstraints = false
       passwordTextField2.translatesAutoresizingMaskIntoConstraints = false
       
       NSLayoutConstraint.activate([
        passwordTextField1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
        passwordTextField1.heightAnchor.constraint(equalToConstant: 50),
        passwordTextField1.leftAnchor.constraint(equalTo:  view.leftAnchor, constant: 16),
        passwordTextField1.rightAnchor.constraint(equalTo:  view.rightAnchor, constant: -16),
        
        passwordTextField2.topAnchor.constraint(equalTo: passwordTextField1.bottomAnchor, constant: 40),
        passwordTextField2.heightAnchor.constraint(equalToConstant: 50),
        passwordTextField2.leftAnchor.constraint(equalTo:  view.leftAnchor, constant: 16),
        passwordTextField2.rightAnchor.constraint(equalTo:  view.rightAnchor, constant: -16),
       ])
    }
}

// MARK: - Text Field 
extension PasswordViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Password : \(textField.text ?? "nil" )")
        return true
    }
}
