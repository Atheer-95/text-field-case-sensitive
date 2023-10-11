//
//  UsernameViewController.swift
//  CIBPay textField
//
//  Created by Atheer Othman on 25/03/1445 AH.
//

import UIKit

class UsernameViewController: UIViewController {

    let TextFieldTableViewCellIdentifier = "TextFieldTableViewCell"
    let UsernameFormatsTableViewCellIdentifier = "UsernameFormatsTableViewCell"
    let ButtonTableViewCellIdentifier = "ButtonTableViewCell"
    
    lazy var usernameTF: CustomTextField = {
        let tf = CustomTextField()
        tf.placeholder = "Username"

        return tf
    }()
    
    lazy var tableView: UITableView = {
        let tb = UITableView()
        return tb

    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
        tableView.register(TextFieldTableViewCell.self, forCellReuseIdentifier: TextFieldTableViewCellIdentifier)
        tableView.register(UsernameFormatsTableViewCell.self, forCellReuseIdentifier: UsernameFormatsTableViewCellIdentifier)
        tableView.register(ButtonTableViewCell.self, forCellReuseIdentifier: ButtonTableViewCellIdentifier)
    }
    
    func isUsernameValid() -> Bool{
        
        if usernameTF.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
            print("Not valid")
            return false
        }
        
        let password = usernameTF.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if password.count < 6 {
           print("Not valid")
            return false
        }
        return true
    }

}

// MARK: - TableView Delegate & DataSource
extension UsernameViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return Section.allCases.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch Section.allCases[section] {
        case .usernameTextField: return 1
        case .usernameFormats: return 5 // formats
        case .buttons: return 2
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch Section.allCases[indexPath.section] {
        case .usernameTextField:
            let cell: TextFieldTableViewCell = tableView.dequeueReusableCell(withIdentifier: TextFieldTableViewCellIdentifier) as! TextFieldTableViewCell
            return cell
        case .usernameFormats:
            let cell: UsernameFormatsTableViewCell = tableView.dequeueReusableCell(withIdentifier: UsernameFormatsTableViewCellIdentifier) as! UsernameFormatsTableViewCell
            cell.setupLabel(text: "this is username format")
            return cell
        case .buttons:
            let cell: ButtonTableViewCell = tableView.dequeueReusableCell(withIdentifier: ButtonTableViewCellIdentifier) as! ButtonTableViewCell
            return cell
            
        }
            
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch Section.allCases[indexPath.section] {
        case .usernameTextField: return 80
        case .usernameFormats: return 25
        case .buttons: return 100
        }
    }
    
}

// MARK: - Text Field
extension UsernameViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Username : \(textField.text ?? "nil" )")
        
        return isUsernameValid()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // get the current text, or use an empty string if that failed
        let currentText = textField.text ?? ""

        // attempt to read the range they are trying to change, or exit if we can't
        guard let stringRange = Range(range, in: currentText) else { return false }

        // add their new text to the existing text
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)

        
        // make sure the result is under 30 characters
        return updatedText.count <= 30
        
        
    }
}

//MARK: - Constraints
extension UsernameViewController {
    func setUI(){
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo:  view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo:  view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
     }

}
/*
 
 Username Rules: -
 
 Maximum length should be 30 characters
 Minimum length should be 6 characters
 Special characters not allowed. (#, %, &, ^, !)
 Spaces is not allowed.
 Alphanumeric (xshi193)
 
 */

private enum Section: CaseIterable {
    case usernameTextField, usernameFormats, buttons
    
    var title: String {
        switch self {
        case .usernameTextField: return ""
        case .usernameFormats: return ""
        case .buttons: return ""
        }
    }
}
