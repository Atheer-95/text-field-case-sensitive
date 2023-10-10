//
//  PasswordViewController.swift
//  CIBPay textField
//
//  Created by Atheer Othman on 25/03/1445 AH.
//

import UIKit

class PasswordViewController: UIViewController {

    private var  passwordTextField: UITextField = {
        let tf = UITextField()
        return tf
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextField()
        // Do any additional setup after loading the view.
    }
  
   func setTextField(){
       view.addSubview(passwordTextField)
       passwordTextField.translatesAutoresizingMaskIntoConstraints = false
       
       NSLayoutConstraint.activate([
        passwordTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
        passwordTextField.heightAnchor.constraint(equalToConstant: 40),
        passwordTextField.widthAnchor.constraint(equalToConstant: view.frame.width - 20)
       ])
    }
}
