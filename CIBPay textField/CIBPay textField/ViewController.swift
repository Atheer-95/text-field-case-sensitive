//
//  ViewController.swift
//  CIBPay textField
//
//  Created by Atheer Othman on 24/03/1445 AH.
//

import UIKit

class ViewController: UIViewController {
    
    private var pswBtn: UIButton = {
        let btn  = UIButton()
        btn.setTitle("Go to Password", for: .normal)
        btn.addTarget(self, action: #selector(goToPsw), for: .touchUpInside)
        return btn
    }()
    
    private var usernameBtn: UIButton = {
        let btn  = UIButton()
        btn.setTitle("Go to Username", for: .normal)
        btn.addTarget(self, action: #selector(goToUser), for: .touchUpInside)
        return btn
    }()
    
//    private var genericTabelbtn: UIButton = {
//        let btn  = UIButton()
//        btn.setTitle("Go to Generic Table", for: .normal)
//        btn.addTarget(self, action: #selector(goToTable), for: .touchUpInside)
//        return btn
//    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtons()
    }

    func setButtons(){
        view.addSubview(pswBtn)
        view.addSubview(usernameBtn)
        pswBtn.translatesAutoresizingMaskIntoConstraints = false
        usernameBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pswBtn.heightAnchor.constraint(equalToConstant: 40),
            pswBtn.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
            pswBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            
            usernameBtn.heightAnchor.constraint(equalToConstant: 40),
            usernameBtn.topAnchor.constraint(equalTo: pswBtn.bottomAnchor, constant: 16),
            usernameBtn.centerXAnchor.constraint(equalTo: pswBtn.centerXAnchor)
        ])
        
        
    }

    @objc func goToPsw(){
        let vc = PasswordViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func goToUser(){
        let vc = UsernameViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
//    @objc func goToTable(){
//        let vc = GenericTableViewController()
//        self.navigationController?.pushViewController(vc, animated: true)
//    }
}


