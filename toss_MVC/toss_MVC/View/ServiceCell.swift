//
//  ServiceCell.swift
//  toss_MVC
//
//  Created by 장창순 on 06/07/2020.
//  Copyright © 2020 AnAppPerTwoWeeks. All rights reserved.
//

import UIKit

class ServiceCell: UITableViewCell {
    
    private let serviceText = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        super.awakeFromNib()
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setupCell() {
        selectionStyle = .none
        accessoryType = .disclosureIndicator
        
        addSubview(serviceText)
        serviceText.textColor = .black
        serviceText.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        serviceText.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(20)
        }
    }
    
    func setServiceText(_ text: String) {
        serviceText.text = text
    }
    
}
