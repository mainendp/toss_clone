//
//  ConfirmViewController.swift
//  toss_MVC
//
//  Created by 장창순 on 07/07/2020.
//  Copyright © 2020 AnAppPerTwoWeeks. All rights reserved.
//

import UIKit

class ConfirmViewController: UIViewController, PopToRootViewControllerDelegate {
    
    private let confirmView = ConfirmView()
    var bankAccount = BankAccount()
    var amountMoney = ""
    
    override func loadView() {
        view = confirmView
        confirmView.setAccountData(bankAccount, amountMoney)
        confirmView.sendButton.addTarget(self, action: #selector(send), for: .touchUpInside)
    }
    
    @objc private func send() {
        let completeVC = CompleteViewController()
        completeVC.delegate = self
        completeVC.bankAccount = bankAccount
        completeVC.amountMoney = amountMoney
        hidesBottomBarWhenPushed = true
        completeVC.modalPresentationStyle = .fullScreen
        present(completeVC, animated: true)
    }
    
    func popToRootViewController() {
        self.navigationController?.popToRootViewController(animated: false)
    }
}
