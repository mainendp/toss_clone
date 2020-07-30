//
//  ConfirmView.swift
//  toss_MVC
//
//  Created by 장창순 on 29/07/2020.
//  Copyright © 2020 AnAppPerTwoWeeks. All rights reserved.
//

import UIKit

class ConfirmView: UIView {
    
    private let bankImage = UIImageView()
    private let descriptionText = UILabel()
    private let accountNumber = UILabel()
    private let reciever = UILabel()
    private let bankListView = UIView()
    private let freeFeeCountText = UILabel()
    private let bankImageInBottomView = UIImageView()
    private let sendFromBank = UILabel()
    private let balance = UILabel()
    private let disclosure = UILabel()
    let sendButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .white
        
        addSubview(bankImage)
        bankImage.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide.snp.top).multipliedBy(2)
            make.width.height.equalTo(100)
        }
        
        addSubview(descriptionText)
        descriptionText.numberOfLines = 0
        descriptionText.textAlignment = .center
        descriptionText.textColor = .black
        descriptionText.font = UIFont(name: "HelveticaNeue-Medium", size: 28)
        descriptionText.snp.makeConstraints { (make) in
            make.top.equalTo(bankImage.snp.bottom).offset(20)
            make.left.equalTo(safeAreaLayoutGuide.snp.left).offset(40)
            make.right.equalTo(safeAreaLayoutGuide.snp.right).offset(-40)
        }
        
        addSubview(accountNumber)
        accountNumber.textAlignment = .center
        accountNumber.textColor = UIColor(red: 78/255, green: 89/255, blue: 104/255, alpha: 1.0)
        accountNumber.font = UIFont(name: "HelveticaNeue-Regular", size: 14)
        accountNumber.snp.makeConstraints { (make) in
            make.top.equalTo(descriptionText.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        addSubview(reciever)
        reciever.font = UIFont(name: "HelveticaNeue", size: 19)
        reciever.backgroundColor = UIColor(red: 242/255, green: 243/255, blue: 245/255, alpha: 1.0)
        reciever.layer.cornerRadius  = 15
        reciever.clipsToBounds = true
        reciever.textAlignment = .center
        reciever.textColor = UIColor(red: 66/255, green: 76/255, blue: 92/255, alpha: 1.0)
        reciever.snp.makeConstraints { (make) in
            make.top.equalTo(accountNumber.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
            make.width.equalTo(225)
            make.height.equalTo(45)
        }
        
        addSubview(freeFeeCountText)
        freeFeeCountText.text = "수수료 면제 10회 남음"
        freeFeeCountText.font = UIFont(name: "HelveticaNeue-Regular", size: 14)
        freeFeeCountText.textAlignment = .center
        freeFeeCountText.textColor = UIColor(red: 66/255, green: 76/255, blue: 92/255, alpha: 1.0)
        freeFeeCountText.snp.makeConstraints { (make) in
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-5)
            make.centerX.equalToSuperview()
        }
        
        addSubview(sendButton)
        sendButton.setTitle("보내기", for: .normal)
        sendButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Medium", size: 19)
        sendButton.setTitleColor(UIColor.white, for: .normal)
        sendButton.layer.cornerRadius = 15
        sendButton.backgroundColor = UIColor(red: 49/255, green: 130/255, blue: 246/255, alpha: 1.0)
        sendButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(freeFeeCountText.snp.top).offset(-10)
            make.left.equalTo(safeAreaLayoutGuide.snp.left).offset(20)
            make.right.equalTo(safeAreaLayoutGuide.snp.right).offset(-20)
            make.height.equalTo(60)
        }
        
        addSubview(bankListView)
        bankListView.backgroundColor = .white
        bankListView.snp.makeConstraints { (make) in
            make.bottom.equalTo(sendButton.snp.top)
            make.left.right.equalToSuperview()
            make.height.equalTo(80)
        }
        
        bankListView.addSubview(disclosure)
        disclosure.text = ">"
        disclosure.font = UIFont(name: "HelveticaNeue", size: 23)
        disclosure.textColor = UIColor(red: 93/255, green: 105/255, blue: 121/255, alpha: 1.0)
        disclosure.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalTo(bankListView.snp.right).offset(-20)
        }
        
        bankListView.addSubview(bankImageInBottomView)
        bankImageInBottomView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.centerY.equalToSuperview().offset(-12)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
        
        bankListView.addSubview(sendFromBank)
        sendFromBank.font = UIFont(name: "HelveticaNeue-Medium", size: 19)
        sendFromBank.textColor = .black
        sendFromBank.snp.makeConstraints { (make) in
            make.left.equalTo(bankImageInBottomView.snp.right).offset(15)
            make.centerY.equalToSuperview().offset(-13)
        }
        
        bankListView.addSubview(balance)
        balance.font = UIFont(name: "HelveticaNeue", size: 17)
        balance.textColor = UIColor(red: 107/255, green: 118/255, blue: 132/255, alpha: 1.0)
        balance.snp.makeConstraints { (make) in
            make.left.equalTo(bankImageInBottomView.snp.right).offset(15)
            make.centerY.equalToSuperview().offset(13)
        }
        
    }
    
    func setAccountData(_ bankAccount: BankAccount,_ amountMoney: String) {
        bankImage.image = UIImage(named: bankAccount.getBankLogo)
        descriptionText.text = "\(bankAccount.getBankName) 계좌로\n\(amountMoney)원을 보냅니다"
        accountNumber.text = "\(bankAccount.getAccountNumber)"
        reciever.text = "받는 분 통장 표시: \(bankAccount.getUserName)"
        bankImageInBottomView.image = UIImage(named: bankAccount.getBankLogo)
        sendFromBank.text = "\(bankAccount.getBankName)에서 출금"
        balance.text = "잔액 \(bankAccount.getBalance) 원"
    }
}
