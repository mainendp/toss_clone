//
//  CompleteViewController.swift
//  toss_MVC
//
//  Created by 장창순 on 07/07/2020.
//  Copyright © 2020 AnAppPerTwoWeeks. All rights reserved.
//

import UIKit

class CompleteViewController: UIViewController {
    
    weak var delegate: PopToRootViewControllerDelegate?
    private let completeView = CompleteView()
    var bankAccount = BankAccount()
    var amountMoney = ""
    
    override func loadView() {
        view = completeView
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        completeView.setAccountData(bankAccount, amountMoney)
        completeView.okButton.addTarget(self, action: #selector(okButtonPressed), for: .touchUpInside)
    }
    
    @objc private func okButtonPressed() {
        self.delegate?.popToRootViewController()
        self.dismiss(animated: true)
    }
}
