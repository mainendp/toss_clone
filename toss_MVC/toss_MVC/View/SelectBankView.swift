//
//  SelectBankView.swift
//  toss_MVC
//
//  Created by 장창순 on 07/07/2020.
//  Copyright © 2020 AnAppPerTwoWeeks. All rights reserved.
//

import UIKit

class SelectBankView: UIView {
    
    private let placeholderLabel = UILabel()
    private let downArrowLabel = UILabel()
    private let bottomLine = UIView()
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        backgroundColor = .white
        
        addSubview(placeholderLabel)
        placeholderLabel.text = "은행 선택"
        placeholderLabel.font = UIFont(name: "HelveticaNeue-Medium", size: 24)
        placeholderLabel.textColor = UIColor(red: 171/255, green: 180/255, blue: 189/255, alpha: 1.0)
        placeholderLabel.snp.makeConstraints { (make) in
            make.leading.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(40)
        }
        
        addSubview(bottomLine)
        bottomLine.backgroundColor = UIColor(red: 241/255, green: 243/255, blue: 245/255, alpha: 1.0)
        bottomLine.snp.makeConstraints { (make) in
            make.top.equalTo(placeholderLabel.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(3)
        }
        
        addSubview(downArrowLabel)
        downArrowLabel.text = "˅"
        downArrowLabel.font = UIFont(name: "HelveticaNeue-Medium", size: 30)
        downArrowLabel.textColor = UIColor(red: 97/255, green: 109/255, blue: 123/255, alpha: 1.0)
        downArrowLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(5)
        }
    }
    
}
