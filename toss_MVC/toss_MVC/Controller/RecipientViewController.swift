//
//  RecipientViewController.swift
//  toss_MVC
//
//  Created by 장창순 on 07/07/2020.
//  Copyright © 2020 AnAppPerTwoWeeks. All rights reserved.
//

import UIKit

class RecipientViewController: UIViewController, PushViewControllerDelegate {
    
    private let recipientView = RecipientView()
    var amountMoney = ""
    
    override func loadView() {
        view = recipientView
        setup()
    }
    
    private func setup() {
        recipientView.collectionView.delegate = self
        recipientView.collectionView.dataSource  = self
        navigationItem.title = "\(amountMoney)원 받는 분 입력"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let itemAt = Int(targetContentOffset.pointee.x / view.frame.width)
        let indexPath = IndexPath(item: itemAt, section: 0)
        recipientView.scrollPage(indexPath)
    }
    
    func pushViewController(bankAccount: BankAccount) {
        let confirmVC = ConfirmViewController()
        confirmVC.bankAccount = bankAccount
        confirmVC.amountMoney = amountMoney
        hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(confirmVC, animated: true)
        hidesBottomBarWhenPushed = false
    }
}

extension RecipientViewController: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch (indexPath.row) {
        case 0:
            guard let recentPageCell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecentPageCell", for: indexPath) as? RecentPageCell else { return UICollectionViewCell() }
            return recentPageCell
        case 1:
            guard let bankListPageCell = collectionView.dequeueReusableCell(withReuseIdentifier: "BankListPageCell", for: indexPath) as? BankListPageCell else { return UICollectionViewCell() }
            bankListPageCell.delegate = self
            return bankListPageCell
        case 2:
            guard let contactPageCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContactPageCell", for: indexPath) as? ContactPageCell else { return UICollectionViewCell() }
            return contactPageCell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}
