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
    var textFiledInput: String?
    
    
    lazy var usernameTF: CustomTextField = {
        let tf = CustomTextField()
        tf.placeholder = "Username"

        return tf
    }()
    
    lazy var nextButton: CustomButton = {
        let btn = CustomButton()
        btn.filledStyleButton(title: "Next")
        return btn
    }()
    
    lazy var previousButton: CustomButton = {
        let btn = CustomButton()
        btn.borderStyledButton(title: "Previous")
        return btn
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
        tableView.register(TextFieldFormatsTableViewCell.self, forCellReuseIdentifier: UsernameFormatsTableViewCellIdentifier)
        tableView.register(ButtonTableViewCell.self, forCellReuseIdentifier: ButtonTableViewCellIdentifier)
    }
    
    func isUsernameValid() -> Bool{
        
//        if usernameTF.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
//            print("Not valid")
//            return false
//        }
//        
//        let username = usernameTF.text!.trimmingCharacters(in: .whitespacesAndNewlines)
//        if username.count < 6 {
//           print("Not valid")
//            return false
//        }
        return false
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
//        case .buttons: return 2
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch Section.allCases[indexPath.section] {
        case .usernameTextField:
            let cell: TextFieldTableViewCell = tableView.dequeueReusableCell(withIdentifier: TextFieldTableViewCellIdentifier) as! TextFieldTableViewCell
    
            cell.formatDelegate = self
//            cell.format(text: cell.usernameTextField.text ?? "Null")
            return cell
        case .usernameFormats:
            let cell: TextFieldFormatsTableViewCell = tableView.dequeueReusableCell(withIdentifier: UsernameFormatsTableViewCellIdentifier) as! TextFieldFormatsTableViewCell
            let data = usernameFormats[indexPath.row]
//            cell.setupLabel(text: data)
            cell.setupData(data: data.format)
            cell.isTextFormated(textFiledInput ?? "")
            return cell
//        case .buttons:
//            let cell: ButtonTableViewCell = tableView.dequeueReusableCell(withIdentifier: ButtonTableViewCellIdentifier) as! ButtonTableViewCell
//            return cell
            
        }
            
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch Section.allCases[section]{
        case.usernameTextField: return "Enter your preferred username"
        case .usernameFormats: return ""
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch Section.allCases[indexPath.section] {
        case .usernameTextField: return 100
        case .usernameFormats: return 30
//        case .buttons: return 100
        }
    }
    
}

// MARK: - Text Field Delegate
extension UsernameViewController: UITextFieldDelegate {

   
}

//MARK: - Constraints
extension UsernameViewController {
    func setUI(){
        view.addSubview(tableView)
        view.addSubview(nextButton)
        view.addSubview(previousButton)
        view.addSubview(nextButton)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        previousButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo:  view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo:  view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: nextButton.topAnchor),
            
            nextButton.bottomAnchor.constraint(equalTo: previousButton.topAnchor, constant: -12),
            nextButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            nextButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            
            previousButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -12),
            previousButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            previousButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16)
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
// MARK: - TextFieldFormateDelegate

extension UsernameViewController: TextFieldFormateDelegate {
    func format(text: String ) {
        self.textFiledInput = text
        self.tableView.reloadSections(IndexSet(integersIn: 1...1), with: .automatic)
    }
}

// MARK: - Sections
private enum Section: CaseIterable {
    case usernameTextField, usernameFormats
//         buttons
    
    var title: String {
        switch self {
        case .usernameTextField: return ""
        case .usernameFormats: return ""
//        case .buttons: return ""
        }
    }
}


