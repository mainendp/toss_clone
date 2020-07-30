//
//  UserBankAccountCell.swift
//  toss_MVC
//
//  Created by 장창순 on 07/07/2020.
//  Copyright © 2020 AnAppPerTwoWeeks. All rights reserved.
//

import UIKit

class UserBankAccountCell: UITableViewCell {
    
    private let bankLogo = UIImageView()
    private let myBankLabel  = UILabel()
    private let myBankNumberLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        super.awakeFromNib()
        setupUI()        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateCell(bankAccount: BankAccount) {
        myBankLabel.text = bankAccount.getBankName
        myBankNumberLabel.text = bankAccount.getAccountNumber
        bankLogo.image = UIImage(named: bankAccount.getBankLogo)
    }
    
    private func setupUI() {
        self.selectionStyle = .none
        
        addSubview(bankLogo)
        bankLogo.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.width.height.equalTo(45)
        }
        
        addSubview(myBankLabel)
        myBankLabel.font = UIFont(name: "HelveticaNeue-Medium", size: 18)
        myBankLabel.textColor = UIColor(red: 15/255, green: 21/255, blue: 30/255, alpha: 1.0)
        myBankLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(bankLogo.snp.trailing).offset(20)
            make.top.equalTo(bankLogo.snp.top)
        }
        
        addSubview(myBankNumberLabel)
        myBankNumberLabel.font = UIFont(name: "HelveticaNeue", size: 16)
        myBankNumberLabel.textColor = UIColor(red: 98/255, green: 110/255, blue: 125/255, alpha: 1.0)
        myBankNumberLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(bankLogo.snp.trailing).offset(20)
            make.bottom.equalTo(bankLogo.snp.bottom)
        }
    }
    
}
