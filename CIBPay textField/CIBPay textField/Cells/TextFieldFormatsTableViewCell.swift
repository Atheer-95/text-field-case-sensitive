//
//  UsernameFormatsTableViewCell.swift
//  CIBPay textField
//
//  Created by Atheer Othman on 26/03/1445 AH.
//

import UIKit

class TextFieldFormatsTableViewCell: UITableViewCell {

    
    
    lazy var formatLabel: UILabel = {
        let l = UILabel()
        return l
    }()
    
    lazy var formatImage: UIImageView = {
       let img = UIImageView()
        img.image = UIImage(systemName: "circle")
        img.tintColor = .gray
        return img
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupInterface()
        formatLabel.font = UIFont(descriptor: .preferredFontDescriptor(withTextStyle: .body), size: 15)
        formatLabel.textColor = .systemGray
    }
    
    func setupLabel(text: String) {
        formatLabel.text = text
    }
    
    func setupData(data: String) {
        formatLabel.text = data
    }
    
    func setupInterface(){
        contentView.addSubview(formatLabel)
        contentView.addSubview(formatImage)
        backgroundColor = .clear
        selectionStyle = .none
        formatLabel.translatesAutoresizingMaskIntoConstraints = false
        formatImage.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            formatImage.heightAnchor.constraint(equalToConstant: 15),
            formatImage.widthAnchor.constraint(equalToConstant: 14),
//            image.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            formatImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            formatImage.centerYAnchor.constraint(equalTo: formatLabel.centerYAnchor),
            
            formatLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            formatLabel.leftAnchor.constraint(equalTo:  formatImage.rightAnchor, constant: 12),
            formatLabel.rightAnchor.constraint(equalTo:  rightAnchor, constant: -16),
            formatLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 12)
            
        ])
     }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func isTextFormated(_ bool: Bool) {
        if bool {
            changeOptionState()
        }
    }
    
    func changeOptionState(){
        formatLabel.textColor = .green
        formatImage.image = UIImage(systemName: "checkmark.circle.fill")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
