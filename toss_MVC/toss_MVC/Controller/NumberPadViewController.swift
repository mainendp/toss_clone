//
//  NumberPadViewController.swift
//  toss_MVC
//
//  Created by 장창순 on 08/07/2020.
//  Copyright © 2020 AnAppPerTwoWeeks. All rights reserved.
//

import UIKit

class NumberPadViewController: UIViewController, ButtonCreationDelegate {
    
    private let padView = NumberPadView()
    private let numberModel = Number()
    private var numberObservation = [NSKeyValueObservation]()
    private let maxNumber = "2000000"
    
    override func loadView() {
        view = padView
        padView.delegate = self
        padView.sendButton.addTarget(self, action: #selector(sendMoney), for: .touchUpInside)
        padView.changeMaxAmount.addTarget(self, action: #selector(setMaxAmount), for: .touchUpInside)
        setupNavigation()
        updateNumberLabel()
    }
    
    private func setupNavigation() {
        navigationItem.title = "금액을 입력하세요"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: nil)
    }
    
    func createNumberButton(with tag: Int) {
        switch tag {
        case 9,11:
            numberModel.updateNumber(tag)
        default:
            if Int(numberModel.currentNumber)! > 2000001 {
                padView.currentNumber.shake()
                padView.wonLabel.shake()
            } else {
                numberModel.updateNumber(tag)
            }
        }
    }
    
    @objc private func setMaxAmount() {
        numberModel.setMaxNum(maxNumber)
    }
    
    private func updateNumberLabel() {
        let numberObserver = numberModel.observe(\.currentNumber, options: .new) { (number, change) in
            self.padView.animateNumber(number: number)
        }
        numberObservation.append(numberObserver)
    }
    deinit {
        numberObservation.removeAll()
    }
    
    @objc private func sendMoney() {
        let recipientVC = RecipientViewController()
        guard let money = padView.currentNumber.text else { return }
        recipientVC.amountMoney = money
        hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(recipientVC, animated: true)
    }
}
