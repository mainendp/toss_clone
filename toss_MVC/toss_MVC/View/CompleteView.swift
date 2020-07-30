//
//  CompleteView.swift
//  toss_MVC
//
//  Created by 장창순 on 29/07/2020.
//  Copyright © 2020 AnAppPerTwoWeeks. All rights reserved.
//

import UIKit

class CompleteView: UIView {
    
    private let bankImage = UIImageView()
    private let successMessage = UILabel()
    private let recieverAccountLabel = UILabel()
    private let recieverAccountText = UILabel()
    private let dateLabel = UILabel()
    private let dateText = UILabel()
    private var date = Date()
    let okButton = UIButton()
    
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
            make.top.equalTo(safeAreaLayoutGuide.snp.top).multipliedBy(4)
            make.width.height.equalTo(100)
        }
        
        addSubview(successMessage)
        successMessage.numberOfLines = 0
        successMessage.textAlignment = .center
        successMessage.textColor = .black
        successMessage.font = UIFont(name: "HelveticaNeue-Medium", size: 28)
        
        successMessage.snp.makeConstraints { (make) in
            make.top.equalTo(bankImage.snp.bottom).offset(20)
            make.left.equalTo(safeAreaLayoutGuide.snp.left).offset(40)
            make.right.equalTo(safeAreaLayoutGuide.snp.right).offset(-40)
        }
        
        addSubview(okButton)
        okButton.setTitle("확인", for: .normal)
        okButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Medium", size: 19)
        okButton.setTitleColor(UIColor.white, for: .normal)
        okButton.layer.cornerRadius = 15
        okButton.backgroundColor = UIColor(red: 49/255, green: 130/255, blue: 246/255, alpha: 1.0)
        
        okButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-10)
            make.left.equalTo(safeAreaLayoutGuide.snp.left).offset(20)
            make.right.equalTo(safeAreaLayoutGuide.snp.right).offset(-20)
            make.height.equalTo(60)
        }
        
        addSubview(dateLabel)
        dateLabel.text = "날짜"
        dateLabel.font = UIFont(name: "HelveticaNeue", size: 18)
        dateLabel.textColor = UIColor(red: 66/255, green: 76/255, blue: 92/255, alpha: 1.0)
        dateLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(okButton.snp.top).offset(-40)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(40)
        }
        
        addSubview(recieverAccountLabel)
        recieverAccountLabel.text = "입금 계좌"
        recieverAccountLabel.font = UIFont(name: "HelveticaNeue", size: 18)
        recieverAccountLabel.textColor = UIColor(red: 66/255, green: 76/255, blue: 92/255, alpha: 1.0)
        recieverAccountLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(dateLabel.snp.top).offset(-20)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(40)
        }
        
        addSubview(dateText)
        dateText.text = getDate()
        dateText.font = UIFont(name: "HelveticaNeue-Medium", size: 18)
        dateText.textColor = UIColor(red: 41/255, green: 51/255, blue: 66/255, alpha: 1.0)
        dateText.snp.makeConstraints { (make) in
            make.bottom.equalTo(okButton.snp.top).offset(-40)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-40)
        }
        
        addSubview(recieverAccountText)
        
        recieverAccountText.font = UIFont(name: "HelveticaNeue-Medium", size: 18)
        recieverAccountText.textColor = UIColor(red: 41/255, green: 51/255, blue: 66/255, alpha: 1.0)
        recieverAccountText.snp.makeConstraints { (make) in
            make.bottom.equalTo(dateText.snp.top).offset(-20)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-40)
        }
    }
    
    func setAccountData(_ bankAccount: BankAccount,_ amountMoney: String) {
        bankImage.image = UIImage(named: bankAccount.getBankLogo)
        successMessage.text = "\(amountMoney)원\n송금 완료"
        recieverAccountText.text = "\(bankAccount.bankName) 계좌"
    }
    
    private func getDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy년 MM월 dd일 HH:MM"
        return dateFormatter.string(from: date)
    }
}
