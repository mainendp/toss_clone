//
//  SectionHeaderView.swift
//  toss_MVC
//
//  Created by 장창순 on 08/07/2020.
//  Copyright © 2020 AnAppPerTwoWeeks. All rights reserved.
//

import UIKit

class SectionHeaderView: UIView {
    
    private let myAccountText = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(myAccountText)
        myAccountText.text = "내 계좌"
        myAccountText.font = UIFont(name: "HelveticaNeue-Bold", size: 19)
        myAccountText.textColor = UIColor(red: 98/255, green: 110/255, blue: 125/255, alpha: 1.0)
        myAccountText.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(20)
            make.centerY.equalToSuperview().offset(10)
        }
    }
    
}
