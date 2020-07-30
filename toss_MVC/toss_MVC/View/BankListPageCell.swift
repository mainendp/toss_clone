//
//  BankListPageCell.swift
//  toss_MVC
//
//  Created by 장창순 on 07/07/2020.
//  Copyright © 2020 AnAppPerTwoWeeks. All rights reserved.
//

import UIKit

class BankListPageCell: UICollectionViewCell {
    
    weak var delegate: PushViewControllerDelegate?
    private let tableview = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        tableview.keyboardDismissMode = .onDrag
        tableview.delegate = self
        tableview.dataSource = self
        tableview.separatorStyle = .none
        tableview.register(SelectBankCell.self, forCellReuseIdentifier: "SelectBankCell")
        tableview.register(UserBankAccountCell.self, forCellReuseIdentifier: "UserBankAccountCell")
        
        addSubview(tableview)
        tableview.backgroundColor = .white
        tableview.snp.makeConstraints { (make) in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalToSuperview().offset(70)
        }
    }
}

extension BankListPageCell: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch (section) {
        case 0:
            return 1
        default:
            return UserService.shared.user.userBankAccountCount
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch (indexPath.section) {
        case 0:
            guard let selectBankCell = tableView.dequeueReusableCell(withIdentifier: "SelectBankCell", for: indexPath) as? SelectBankCell else { return UITableViewCell() }
            return selectBankCell
        default:
            guard let userBankAccountcell = tableView.dequeueReusableCell(withIdentifier: "UserBankAccountCell", for: indexPath) as? UserBankAccountCell else { return UITableViewCell() }
            userBankAccountcell.updateCell(bankAccount: UserService.shared.user.getUserBankAccountAt(indexPath.row))
            return userBankAccountcell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch (indexPath.section) {
        case 0:
            return 210
        default:
            return 80
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section != 0 {
            
            delegate?.pushViewController(bankAccount: UserService.shared.user.userBankAccount[indexPath.row])
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch (section) {
        case 0:
            return nil
        default:
            let sectionHeader = SectionHeaderView()
            self.addSubview(sectionHeader)
            return sectionHeader
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch (section) {
        case 0:
            return 0
        default:
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        switch (section) {
        case 0:
            let footerView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 16))
            footerView.backgroundColor = UIColor(red: 241/255, green: 243/255, blue: 245/255, alpha: 1.0)
            return footerView
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        switch (section) {
        case 0:
            return 16
        default:
            return 0
        }
    }
    
}
