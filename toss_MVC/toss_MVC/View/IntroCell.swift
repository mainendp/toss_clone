//
//  IntroCell.swift
//  toss_MVC
//
//  Created by 장창순 on 06/07/2020.
//  Copyright © 2020 AnAppPerTwoWeeks. All rights reserved.
//

import UIKit

class IntroCell: UITableViewCell {
    
    private let userName = UILabel()
    private let introLabel = UILabel()
    private let introView = UIView()
    private let reliefFundLogo = UIImageView()
    private let reliefFundMessage = UILabel()
    private let checkButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        super.awakeFromNib()
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        separatorInset = UIEdgeInsets(top: 0, left: 10000, bottom: 0, right: 0)
        selectionStyle = .none
        
        addSubview(userName)
        userName.text = "\(UserService.shared.user.getUsername) 님,"
        userName.textColor = UIColor.black
        userName.font = UIFont(name: "HelveticaNeue-Bold", size: 25)
        userName.snp.makeConstraints { (make) in
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(25)
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(20)
        }
        
        addSubview(introLabel)
        introLabel.text = "긴급재난지원금은 받으셨나요?"
        introLabel.textColor = UIColor.black
        introLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 25)
        introLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(25)
            make.top.equalTo(userName.snp.bottom).offset(5)
        }
        
        addSubview(introView)
        introView.backgroundColor = .white
        introView.layer.cornerRadius = 15
        introView.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.top.equalTo(introLabel.snp.bottom).offset(20)
            make.height.equalTo(260)
        }
        
        introView.addSubview(reliefFundLogo)
        reliefFundLogo.image = UIImage(named: "reliefFundLogo")
        reliefFundLogo.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.height.width.equalTo(80)
            make.top.equalToSuperview().offset(40)
        }
        
        introView.addSubview(checkButton)
        checkButton.setTitle("남은 금액 확인하기", for: .normal)
        checkButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 19)
        checkButton.setTitleColor(UIColor.white, for: .normal)
        checkButton.layer.cornerRadius = 15
        checkButton.backgroundColor = UIColor(red: 49/255, green: 130/255, blue: 246/255, alpha: 1.0)
        
        checkButton.snp.makeConstraints { (make) in
            make.top.equalTo(reliefFundLogo.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
    }
}
