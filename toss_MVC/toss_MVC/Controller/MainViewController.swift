//
//  MainViewController.swift
//  toss_MVC
//
//  Created by 장창순 on 06/07/2020.
//  Copyright © 2020 AnAppPerTwoWeeks. All rights reserved.
//

import UIKit
import SnapKit

class MainViewController: UITableViewController, ButtonActionDelegate {
    
    private let serviceList = Services()
    private let mainView = MainView()
    
    override func loadView() {
        view = mainView
        mainView.tableview.delegate = self
        mainView.tableview.dataSource = self
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.layoutIfNeeded()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: nil)
    }
    
    func sendMoneyButtonPressed() {
        let NumberPadVC = NumberPadViewController()
        hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(NumberPadVC, animated: true)
        hidesBottomBarWhenPushed = false
    }
}

//MARK: - 테이블뷰 델리게이트 , 데이타소스
extension MainViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch (section) {
        case 0,1:
            return 1
        default:
            return serviceList.listCount
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch (indexPath.section) {
        case 0:
            guard let introCell = mainView.tableview.dequeueReusableCell(withIdentifier: "IntroCell", for: indexPath) as? ServiceCell else { return UITableViewCell() }
            return introCell
        case 1:
            guard let userCell = mainView.tableview.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as? UserCell else { return UITableViewCell() }
            userCell.delegate = self
            return userCell
        default:
            guard let serviceCell = mainView.tableview.dequeueReusableCell(withIdentifier: "ServiceCell", for: indexPath) as? ServiceCell else { return UITableViewCell() }
            serviceCell.setServiceText(serviceList.getServiceAt(indexPath.row))
            return serviceCell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch (indexPath.section) {
        case 0:
            return 360
        case 1:
            return 100
        default:
            return 80
        }
    }
}

