//
//  MainView.swift
//  toss_MVC
//
//  Created by 장창순 on 18/07/2020.
//  Copyright © 2020 AnAppPerTwoWeeks. All rights reserved.
//

import UIKit

class MainView: UIView {
    
    let tableview = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTableView() {
        backgroundColor = .white
        tableview.backgroundColor = .clear
        tableview.register(IntroCell.self, forCellReuseIdentifier: "IntroCell")
        tableview.register(UserCell.self, forCellReuseIdentifier: "UserCell")
        tableview.register(ServiceCell.self, forCellReuseIdentifier: "ServiceCell")
        
        addSubview(tableview)
        tableview.snp.makeConstraints { (make) in
            make.leading.trailing.top.bottom.equalTo(safeAreaLayoutGuide)
        }
    }
}
