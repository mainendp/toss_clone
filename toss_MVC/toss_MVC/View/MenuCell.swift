//
//  MenuCell.swift
//  toss_MVC
//
//  Created by 장창순 on 07/07/2020.
//  Copyright © 2020 AnAppPerTwoWeeks. All rights reserved.
//

import UIKit

class MenuCell: UICollectionViewCell {
    
    private let menuText = UILabel()
    
    override var isSelected: Bool {
        didSet {
            menuText.textColor = isSelected ? UIColor(red: 35/255, green: 45/255, blue: 60/255, alpha: 1.0) : UIColor(red: 97/255, green: 109/255, blue: 123/255, alpha: 1.0)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    private func setupUI() {
        layer.backgroundColor = UIColor.white.cgColor
        addSubview(menuText)
        menuText.font = UIFont(name: "HelveticaNeue-Medium", size: 20)
        menuText.textColor = UIColor(red: 97/255, green: 109/255, blue: 123/255, alpha: 1.0)
        menuText.snp.makeConstraints { (make) in
            make.centerX.centerY.equalToSuperview()
        }
    }
    
    func updateCell(_ text: String) {
        menuText.text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
