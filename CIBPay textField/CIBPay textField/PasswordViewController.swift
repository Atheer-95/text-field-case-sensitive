//
//  PasswordViewController.swift
//  CIBPay textField
//
//  Created by Atheer Othman on 25/03/1445 AH.
//

import UIKit

class PasswordViewController: UIViewController {

    lazy var  passwordTextField1: CustomTextField = {
        let tf = CustomTextField()
        tf.placeholder = "Enter Password"
        return tf
    }()
    
    lazy var  passwordTextField2: CustomTextField = {
        let tf = CustomTextField()
        tf.placeholder = "confirm Password"
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
        
        passwordTextField2.topAnchor.constraint(equalTo: passwordTextField1.bottomAnchor, constant: 16),
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
