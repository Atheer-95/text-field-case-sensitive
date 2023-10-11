//
//  UsernameFormatsTableViewCell.swift
//  CIBPay textField
//
//  Created by Atheer Othman on 26/03/1445 AH.
//

import UIKit

class UsernameFormatsTableViewCell: UITableViewCell {

    lazy var label: UILabel = {
        let l = UILabel()
        return l
    }()
    
    lazy var image: UIImageView = {
       let img = UIImageView()
        img.image = UIImage(systemName: "circle")
        img.tintColor = .gray
        return img
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupInterface()
    }
    
    func setupLabel(text: String) {
        label.text = text
    }
    
    func setupInterface(){
        contentView.addSubview(label)
        contentView.addSubview(image)
        backgroundColor = .clear
        selectionStyle = .none
        label.translatesAutoresizingMaskIntoConstraints = false
        image.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
//            image.heightAnchor.constraint(equalToConstant: 15),
            image.widthAnchor.constraint(equalToConstant: 15),
//            image.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            image.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            image.centerYAnchor.constraint(equalTo: label.centerYAnchor),
            
            label.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            label.leftAnchor.constraint(equalTo:  image.rightAnchor, constant: 12),
            label.rightAnchor.constraint(equalTo:  rightAnchor, constant: -16),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 12)
            
        ])
     }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
