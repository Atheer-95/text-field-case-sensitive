//
//  UsernameViewController.swift
//  CIBPay textField
//
//  Created by Atheer Othman on 25/03/1445 AH.
//

import UIKit

class UsernameViewController: UIViewController {

    lazy var usernameTF: CustomTextField = {
        let tf = CustomTextField()
        tf.placeholder = "Username"
        return tf
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setTextField()
    }

    func setTextField(){
        view.addSubview(usernameTF)
        usernameTF.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            usernameTF.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            usernameTF.heightAnchor.constraint(equalToConstant: 40),
            usernameTF.leftAnchor.constraint(equalTo:  view.leftAnchor, constant: 16),
            usernameTF.rightAnchor.constraint(equalTo:  view.rightAnchor, constant: -16)
        ])
     }
}

// MARK: - Text Field
extension UsernameViewController: UITextFieldDelegate {
    
}
