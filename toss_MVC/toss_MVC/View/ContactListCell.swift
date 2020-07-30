//
//  ContactListCell.swift
//  toss_MVC
//
//  Created by 장창순 on 07/07/2020.
//  Copyright © 2020 AnAppPerTwoWeeks. All rights reserved.
//

import UIKit

class ContactListCell: UITableViewCell {
    
    private let firstCharacterLabel = UILabel()
    private let name  = UILabel()
    private let phoneNumber = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        super.awakeFromNib()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateCell(contact: Contact) {
        name.text = contact.getName
        phoneNumber.text = contact.getPhoneNumber
        firstCharacterLabel.text = String(contact.getName.first ?? " ")
    }
    
    private func setupUI() {
        self.selectionStyle = .none
        
        addSubview(firstCharacterLabel)
        firstCharacterLabel.font = UIFont(name: "HelveticaNeue-Light", size: 19)
        firstCharacterLabel.textColor = UIColor(red: 49/255, green: 130/255, blue: 246/255, alpha: 1.0)
        firstCharacterLabel.textAlignment = .center
        firstCharacterLabel.layer.cornerRadius = 25
        firstCharacterLabel.layer.borderColor = UIColor(red: 241/255, green: 243/255, blue: 245/255, alpha: 1.0).cgColor
        firstCharacterLabel.layer.borderWidth = 2
        firstCharacterLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.width.height.equalTo(45)
        }
        
        addSubview(name)
        name.font = UIFont(name: "HelveticaNeue-Medium", size: 19)
        name.textColor = UIColor(red: 15/255, green: 21/255, blue: 30/255, alpha: 1.0)
        name.snp.makeConstraints { (make) in
            make.leading.equalTo(firstCharacterLabel.snp.trailing).offset(20)
            make.top.equalTo(firstCharacterLabel.snp.top)
        }
        
        addSubview(phoneNumber)
        phoneNumber.font = UIFont(name: "HelveticaNeue", size: 18)
        phoneNumber.textColor = UIColor(red: 98/255, green: 110/255, blue: 125/255, alpha: 1.0)
        phoneNumber.snp.makeConstraints { (make) in
            make.leading.equalTo(firstCharacterLabel.snp.trailing).offset(20)
            make.bottom.equalTo(firstCharacterLabel.snp.bottom)
        }
    }
    
}
