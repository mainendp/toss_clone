//
//  ContactPageCell.swift
//  toss_MVC
//
//  Created by 장창순 on 07/07/2020.
//  Copyright © 2020 AnAppPerTwoWeeks. All rights reserved.
//

import UIKit

class ContactPageCell: UICollectionViewCell {
    
    private let searchBar = UISearchBar()
    private let tableview = UITableView()
    private let border = CALayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
        searchBar.backgroundImage = UIImage()
        searchBar.searchTextField.backgroundColor = .white
        searchBar.placeholder = "연락처를 검색하거나 입력할 수 있습니다"
        addSubview(searchBar)
        searchBar.snp.makeConstraints { (make) in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(70)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(60)
            
        }
        
        border.backgroundColor = UIColor(red: 241/255, green: 243/255, blue: 245/255, alpha: 1.0).cgColor
        border.frame = CGRect(x: 0, y: 60, width: layer.frame.size.width, height: 1)
        searchBar.layer.addSublayer(border)
        
        tableview.delegate = self
        tableview.dataSource = self
        tableview.separatorStyle = .none
        tableview.keyboardDismissMode = .onDrag
        tableview.register(ContactListCell.self, forCellReuseIdentifier: "ContactCell")
        addSubview(tableview)
        tableview.snp.makeConstraints { (make) in
            make.top.equalTo(searchBar.snp.bottom).offset(1)
            make.leading.trailing.equalTo(safeAreaLayoutGuide)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).inset(80)
        }
    }
    
}

extension ContactPageCell: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UserService.shared.user.contactCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let contactCell = tableview.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath) as? ContactListCell else { return UITableViewCell() }
        contactCell.updateCell(contact: UserService.shared.user.getUserContactAt(indexPath.row))
        return contactCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
    
}
