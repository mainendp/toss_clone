//
//  NumberPadView.swift
//  toss_MVC
//
//  Created by 장창순 on 18/07/2020.
//  Copyright © 2020 AnAppPerTwoWeeks. All rights reserved.
//

import UIKit

class NumberPadView: UIView {
    
    weak var delegate: ButtonCreationDelegate?
    private let numberPad = [["1","2","3"],["4","5","6"],["7","8","9"],["취소","0","<-"]]
    private let autoTransferButton = UIButton()
    private let sendButtonStackView = UIStackView()
    private var buttonArray = [UIButton]()
    private let verticalNumberStackView = UIStackView()
    private var buttonTag = 0
    private var currentNumberStackView = UIStackView()
    private let warningMessage = UILabel()
    let sendButton = UIButton()
    let currentNumber = UILabel()
    let wonLabel = UILabel()
    let changeMaxAmount = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .white
        
        autoTransferButton.setTitle("자동이체", for: .normal)
        autoTransferButton.titleLabel?.font = autoTransferButton.titleLabel?.font.withSize(20)
        autoTransferButton.setTitleColor(UIColor(red: 49/255, green: 129/255, blue: 245/255, alpha: 1.0), for: .normal)
        autoTransferButton.layer.cornerRadius = 15
        autoTransferButton.backgroundColor = UIColor(red: 229/255, green: 239/255, blue: 253/255, alpha: 1.0)
        autoTransferButton.alpha = 0.5
        autoTransferButton.isUserInteractionEnabled = false
        
        sendButton.setTitle("송금", for: .normal)
        sendButton.titleLabel?.font = sendButton.titleLabel?.font.withSize(20)
        sendButton.setTitleColor(UIColor.white, for: .normal)
        sendButton.layer.cornerRadius = 15
        sendButton.backgroundColor = UIColor(red: 49/255, green: 130/255, blue: 246/255, alpha: 1.0)
        sendButton.alpha = 0.5
        sendButton.isUserInteractionEnabled = false
        sendButtonStackView.addArrangedSubview(autoTransferButton)
        sendButtonStackView.addArrangedSubview(sendButton)
        sendButtonStackView.axis = .horizontal
        sendButtonStackView.distribution = .fillEqually
        sendButtonStackView.spacing = 10
        
        addSubview(sendButtonStackView)
        sendButtonStackView.snp.makeConstraints { (make) in
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-10)
            make.left.equalTo(safeAreaLayoutGuide.snp.left).offset(20)
            make.right.equalTo(safeAreaLayoutGuide.snp.right).inset(20)
            make.height.equalTo(60)
        }
        
        addSubview(verticalNumberStackView)
        verticalNumberStackView.axis = .vertical
        verticalNumberStackView.alignment = .fill
        verticalNumberStackView.distribution = .fillEqually
        verticalNumberStackView.snp.makeConstraints { (make) in
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-20)
            make.top.equalTo(safeAreaLayoutGuide.snp.bottom).dividedBy(2)
            make.bottom.equalTo(sendButtonStackView.snp.top).offset(-20)
        }
        
        addSubview(currentNumberStackView)
        currentNumberStackView.axis = .horizontal
        currentNumberStackView.alignment = .center
        currentNumberStackView.distribution = .fillProportionally
        currentNumberStackView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().dividedBy(1.75)
        }
        currentNumberStackView.addArrangedSubview(currentNumber)
        currentNumberStackView.addArrangedSubview(wonLabel)
        currentNumber.text = "0"
        wonLabel.text = "원"
        currentNumber.textColor = UIColor(red: 38/255, green: 48/255, blue: 63/255, alpha: 1.0)
        currentNumber.font = UIFont(name: "HelveticaNeue", size: 45)
        wonLabel.font = UIFont(name: "HelveticaNeue", size: 45)
        wonLabel.textColor = UIColor(red: 38/255, green: 48/255, blue: 63/255, alpha: 1.0)
        
        addSubview(warningMessage)
        warningMessage.text = "최대 200만원까지 입력할 수 있습니다"
        warningMessage.textColor = UIColor(red: 228/255, green: 41/255, blue: 57/255, alpha: 1.0)
        warningMessage.font = UIFont(name: "HelveticaNeue", size: 15)
        warningMessage.isHidden = true
        warningMessage.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(currentNumberStackView.snp.bottom).offset(10)
        }
        
        addSubview(changeMaxAmount)
        changeMaxAmount.setTitle("2,000,000원으로 변경", for: .normal)
        changeMaxAmount.titleLabel?.font = changeMaxAmount.titleLabel?.font.withSize(14)
        changeMaxAmount.setTitleColor(UIColor(red: 78/255, green: 89/255, blue: 104/255, alpha: 1.0), for: .normal)
        changeMaxAmount.layer.cornerRadius = 5
        changeMaxAmount.backgroundColor = UIColor(red: 242/255, green: 243/255, blue: 243/255, alpha: 1.0)
        changeMaxAmount.isHidden = true
        changeMaxAmount.isUserInteractionEnabled = false
        
        changeMaxAmount.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.height.equalTo(30)
            make.width.equalTo(150)
            make.top.equalTo(warningMessage.snp.bottom).offset(5)
        }
        
        createNumberButtons()
    }
    
    private func createNumberButtons() {
        for row in 0 ..< 4 {
            var buttons = [UIButton]()
            for col in 0..<3 {
                let numberButton = UIButton()
                numberButton.tag = buttonTag
                numberButton.setTitle("\(numberPad[row][col])", for: .normal)
                numberButton.addTarget(self, action: #selector(addNumber), for: .touchUpInside)
                switch buttonTag {
                case 9,11:
                    numberButton.titleLabel?.font = numberButton.titleLabel?.font.withSize(18)
                    numberButton.setTitleColor(UIColor(red: 107/255, green: 118/255, blue: 132/255, alpha: 1.0), for: .normal)
                    numberButton.alpha = 0
                    numberButton.isUserInteractionEnabled = false
                default:
                    numberButton.titleLabel?.font = numberButton.titleLabel?.font.withSize(30)
                    numberButton.setTitleColor(UIColor(red: 38/255, green: 48/255, blue: 63/255, alpha: 1.0), for: .normal)
                }
                buttons.append(numberButton)
                buttonArray.append(numberButton)
                buttonTag += 1
            }
            let horizontalNumberStackView = UIStackView(arrangedSubviews: buttons)
            horizontalNumberStackView.alignment = .fill
            horizontalNumberStackView.axis = .horizontal
            horizontalNumberStackView.distribution = .fillEqually
            verticalNumberStackView.addArrangedSubview(horizontalNumberStackView)
        }
    }
    
    @objc private func addNumber(_ sender: UIButton) {
        self.delegate?.createNumberButton(with: sender.tag)
    }
    
    private func commaForNumber(_ number: String) -> String {
        var result = NSNumber()
        guard let value = Int(number) else { return "Error" }
        result = value as NSNumber
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        
        guard let resultValue = formatter.string(from: result) else { return "Error" }
        return resultValue
    }
    
    private func setButtonsAlphaAndInteraction(numberAlpha: CGFloat, buttonAlpha: CGFloat, bool: Bool) {
        UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseOut, animations: {
            self.sendButton.alpha = buttonAlpha
            self.autoTransferButton.alpha = buttonAlpha
            self.buttonArray[9].alpha = numberAlpha
            self.buttonArray[11].alpha = numberAlpha
            self.sendButton.isUserInteractionEnabled = bool
            self.autoTransferButton.isUserInteractionEnabled = bool
            self.buttonArray[9].isUserInteractionEnabled = bool
            self.buttonArray[11].isUserInteractionEnabled = bool
        }, completion: nil)
        
    }
    
    func animateNumber(number: Number) {
        UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseOut, animations: {
            switch number.currentNumber {
            case "0":
                self.currentNumber.text = "0"
                self.setButtonsAlphaAndInteraction(numberAlpha: 0, buttonAlpha: 0.5, bool: false)
            default:
                self.setButtonsAlphaAndInteraction(numberAlpha: 1, buttonAlpha: 1, bool: true)
                if Int(number.currentNumber)! > 2000001 {
                    self.currentNumber.text = self.commaForNumber(number.currentNumber)
                    self.warningMessage.isHidden = false
                    self.changeMaxAmount.isHidden = false
                    self.sendButton.alpha = 0.5
                    self.autoTransferButton.alpha = 0.5
                    self.sendButton.isUserInteractionEnabled = false
                    self.autoTransferButton.isUserInteractionEnabled = false
                    self.currentNumber.shake()
                    self.wonLabel.shake()
                } else {
                    self.currentNumber.text = self.commaForNumber(number.currentNumber)
                    self.changeMaxAmount.isUserInteractionEnabled = true
                    self.warningMessage.isHidden = true
                    self.changeMaxAmount.isHidden = true
                }
            }
        }, completion: nil)
    }
}
