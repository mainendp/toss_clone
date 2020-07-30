//
//  RecentPageCell.swift
//  toss_MVC
//
//  Created by 장창순 on 07/07/2020.
//  Copyright © 2020 AnAppPerTwoWeeks. All rights reserved.
//

import UIKit

class RecentPageCell: UICollectionViewCell {
    
    private let mainLabel = UILabel()
    private let subLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
        mainLabel.text = "최근 목록이 없습니다"
        mainLabel.font = UIFont(name: "HelveticaNeue-Medium", size: 20)
        mainLabel.textColor = UIColor(red: 35/255, green: 45/255, blue: 60/255, alpha: 1.0)
        addSubview(mainLabel)
        mainLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview().dividedBy(1.5)
            make.centerX.equalToSuperview()
        }
        
        subLabel.text = "계좌 또는 연락처 탭을 누르고 송금하세요."
        subLabel.font = UIFont(name: "HelveticaNeue", size: 17)
        subLabel.textColor = UIColor(red: 97/255, green: 109/255, blue: 123/255, alpha: 1.0)
        addSubview(subLabel)
        subLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(mainLabel.snp.bottom).offset(10)
        }
    }
    
}
