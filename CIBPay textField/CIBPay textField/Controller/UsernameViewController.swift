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
        btn.isEnabled = false
        btn.filledStyleButton(title: "Next")
        btn.addTarget(self, action: #selector(nextButtonAction), for: .touchUpInside)
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
    
    func isUsernameValid(format: TextFieldFormat) -> Bool{
        guard let username = textFiledInput?.trimmingCharacters(in: .whitespacesAndNewlines) else { return false}
        
        switch format {
        case .maximum_length:
            if username.isEmpty {
                
                return false
            }
            return true
        case .minimum_length:
            // Minimum
            if username.count < 6 {
                return false
            }
        case .spaces:
            // spaces
            if textFiledInput?.rangeOfCharacter(from: .whitespacesAndNewlines) != nil {
                return false
            }
        case .alphanumeric, .special_characters:
            // Alphanumaric and special caracters
            
            let characterset = NSCharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789")
            if username.rangeOfCharacter(from: characterset.inverted) != nil {
                print("string contains special characters")
                return false
            }
        }
        
        if username.isEmpty {
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
        case .usernameFormats: return 5
            //        case .buttons: return 2
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch Section.allCases[indexPath.section] {
        case .usernameTextField:
            let cell: TextFieldTableViewCell = tableView.dequeueReusableCell(withIdentifier: TextFieldTableViewCellIdentifier) as! TextFieldTableViewCell
            
            cell.formatDelegate = self
            return cell
        case .usernameFormats:
            let cell: TextFieldFormatsTableViewCell = tableView.dequeueReusableCell(withIdentifier: UsernameFormatsTableViewCellIdentifier) as! TextFieldFormatsTableViewCell
            let format = TextFieldFormat.allCases[indexPath.row]
            cell.setupData(data: format.title)
            cell.isTextFormated(isUsernameValid(format: format))
            if isUsernameValid(format: format) == true {
                self.nextButton.isEnabled = true
            }
            return cell
            
            
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
    
    @objc func nextButtonAction(){
        print("Next")
    }
}


//MARK: - Constraints
extension UsernameViewController {
    func setUI(){
        view.addSubview(tableView)
        view.addSubview(nextButton)
        view.addSubview(previousButton)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        previousButton.translatesAutoresizingMaskIntoConstraints = false
        
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

// MARK: - TextFieldFormateDelegate

extension UsernameViewController: TextFieldFormateDelegate {
    func format(text: String ) {
        self.textFiledInput = text
        self.tableView.reloadSections(IndexSet(integersIn: 1...1), with: .none)
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

// MARK: - TextFieldFormats

enum TextFieldFormat: CaseIterable {
    case maximum_length,
         minimum_length,
         special_characters,
         spaces,
         alphanumeric
    
    var title: String {
        switch self {
            
        case .maximum_length: return "Maximum length should be 30 characters"
        case .minimum_length: return "Minimum length should be 6 characters"
        case .special_characters: return "Special characters not allowed. (#, %, &, ^, !)"
        case .spaces: return "Spaces is not allowed."
        case .alphanumeric: return "Alphanumeric (xshi193)"
        }
    }
}
