//
//  UserCell.swift
//  toss_MVC
//
//  Created by 장창순 on 06/07/2020.
//  Copyright © 2020 AnAppPerTwoWeeks. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {
    
    weak var delegate: ButtonActionDelegate?
    private let profileImage = UIImageView()
    private let userName = UILabel()
    private let descriptionText = UILabel()
    private let sendMoneyButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        super.awakeFromNib()
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        selectionStyle = .none
        
        addSubview(profileImage)
        profileImage.image = UIImage(named: "profileImage")
        profileImage.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(20)
            make.width.height.equalTo(50)
        }
        
        addSubview(userName)
        userName.text = "장창순"
        userName.textColor = .black
        userName.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        userName.snp.makeConstraints { (make) in
            make.top.equalTo(profileImage.snp.top)
            make.left.equalTo(profileImage.snp.right).offset(10)
        }
        
        addSubview(descriptionText)
        descriptionText.text = "신용 점수 보기"
        descriptionText.textColor = UIColor(red: 107/255, green: 118/255, blue: 132/255, alpha: 1.0)
        descriptionText.font = UIFont(name: "HelveticaNeue-Regular", size: 20)
        descriptionText.snp.makeConstraints { (make) in
            make.bottom.equalTo(profileImage.snp.bottom)
            make.left.equalTo(profileImage.snp.right).offset(10)
        }
        
        addSubview(sendMoneyButton)
        sendMoneyButton.setTitle("송금", for: .normal)
        sendMoneyButton.titleLabel?.font = sendMoneyButton.titleLabel?.font.withSize(17)
        sendMoneyButton.setTitleColor(UIColor(red: 49/255, green: 129/255, blue: 245/255, alpha: 1.0), for: .normal)
        sendMoneyButton.layer.cornerRadius = 7
        sendMoneyButton.backgroundColor = UIColor(red: 229/255, green: 239/255, blue: 253/255, alpha: 1.0)
        sendMoneyButton.addTarget(self, action: #selector(sendMoneyButtonPressed), for: .touchUpInside)
        sendMoneyButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(profileImage)
            make.right.equalToSuperview().inset(20)
            make.width.equalTo(67)
            make.height.equalTo(40)
        }
        
    }
    
    @objc func sendMoneyButtonPressed(_ sender: UIButton) {
        delegate?.sendMoneyButtonPressed()
    }
    
}
