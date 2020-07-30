//
//  Protocol.swift
//  toss_MVC
//
//  Created by 장창순 on 06/07/2020.
//  Copyright © 2020 AnAppPerTwoWeeks. All rights reserved.
//

import Foundation

protocol ButtonActionDelegate: class {
    func sendMoneyButtonPressed()
}

protocol ButtonCreationDelegate: class {
    func createNumberButton(with tag: Int)
}

protocol ScrollMenuBarDelegate: class {
    func scrollMenuBar(scrollTo index: Int)
}

protocol PushViewControllerDelegate : class {
    func pushViewController(bankAccount: BankAccount)
}

protocol PopToRootViewControllerDelegate: class {
    func popToRootViewController()
}
