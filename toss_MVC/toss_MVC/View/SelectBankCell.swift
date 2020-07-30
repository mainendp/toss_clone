//
//  SelectBankCell.swift
//  toss_MVC
//
//  Created by 장창순 on 07/07/2020.
//  Copyright © 2020 AnAppPerTwoWeeks. All rights reserved.
//

import UIKit
import SnapKit

class SelectBankCell: UITableViewCell {
    
    private let accountTextField = UITextField()
    private let placeholderLabel = UILabel()
    private let bottomLine = UIView()
    private let animatedBottomLine = UIView()
    private let selectBankView = SelectBankView()
    private let okButton = UIButton()
    private var leadingContraint: Constraint? = nil
    private var trailingConstraint : Constraint? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        super.awakeFromNib()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private  func selectBank() {
        print("은행 선택")
    }
    
    private func setupUI() {
        accountTextField.delegate = self
        self.selectionStyle = .none
        
        addSubview(accountTextField)
        accountTextField.keyboardType = .numberPad
        accountTextField.borderStyle = .none
        accountTextField.backgroundColor = .white
        
        addSubview(selectBankView)
        selectBankView.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(selectBank))
        selectBankView.addGestureRecognizer(gesture)
        
        selectBankView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(50)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(40)
        }
        
        accountTextField.font = UIFont(name: "Helvetica", size: 20)
        accountTextField.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(selectBankView.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(40)
        }
        
        addSubview(placeholderLabel)
        placeholderLabel.text = "계좌번호 입력"
        placeholderLabel.font = UIFont(name: "HelveticaNeue-Medium", size: 24)
        placeholderLabel.textColor = UIColor(red: 171/255, green: 180/255, blue: 189/255, alpha: 1.0)
        placeholderLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(accountTextField.snp.bottom)
            make.leading.equalTo(accountTextField.snp.leading)
            make.height.equalTo(40)
        }
        
        accountTextField.addSubview(bottomLine)
        bottomLine.backgroundColor = UIColor(red: 241/255, green: 243/255, blue: 245/255, alpha: 1.0)
        bottomLine.snp.makeConstraints { (make) in
            make.bottom.equalTo(accountTextField.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(3)
        }
        
        accountTextField.addSubview(animatedBottomLine)
        animatedBottomLine.backgroundColor = UIColor(red: 49/255, green: 130/255, blue: 246/255, alpha: 1.0)
        accountTextField.layer.masksToBounds = true
        animatedBottomLine.snp.makeConstraints { (make) in
            make.bottom.equalTo(accountTextField.snp.bottom)
            leadingContraint = make.leading.equalTo(safeAreaLayoutGuide.snp.trailing).dividedBy(2).constraint
            trailingConstraint = make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).dividedBy(2).constraint
            make.height.equalTo(3)
        }
        
        addSubview(okButton)
        okButton.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        okButton.setTitle("확인", for: .normal)
        okButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Medium", size: 18)
        okButton.setTitleColor(UIColor.white, for: .normal)
        okButton.backgroundColor = UIColor(red: 49/255, green: 130/255, blue: 246/255, alpha: 1.0)
        okButton.addTarget(self, action: #selector(okButtonPressed), for: .touchUpInside)
        okButton.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(UIScreen.main.bounds.size.height)
            make.height.equalTo(50)
        }
    }
    
    @objc private func okButtonPressed() {
        
    }
}

extension SelectBankCell: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        leadingContraint?.deactivate()
        trailingConstraint?.deactivate()
        
        animatedBottomLine.snp.makeConstraints { (make) in
            leadingContraint = make.leading.equalTo(safeAreaLayoutGuide.snp.leading).constraint
            trailingConstraint = make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).constraint
        }
        
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveLinear, animations: {
            self.layoutIfNeeded()
        }, completion: nil)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let textFieldRange = NSRange(location: 0, length: textField.text?.count ?? 0)
        if NSEqualRanges(range, textFieldRange) && string.count == 0 {
            placeholderLabel.snp.updateConstraints { (make) in
                make.bottom.equalTo(accountTextField.snp.bottom)
                make.leading.equalTo(accountTextField.snp.leading)
                make.height.equalTo(40)
            }
            placeholderLabel.font = UIFont(name: "HelveticaNeue-Medium", size: 24)
        } else {
            placeholderLabel.snp.updateConstraints { (make) in
                make.bottom.equalTo(accountTextField.snp.bottom).inset(accountTextField.frame.height)
                make.leading.equalTo(accountTextField.snp.leading)
                make.height.equalTo(14)
            }
            placeholderLabel.font = UIFont(name: "HelveticaNeue", size: 15)
            
        }
        
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.layoutIfNeeded()
        }, completion: nil)
        return true
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        leadingContraint?.deactivate()
        trailingConstraint?.deactivate()
        
        animatedBottomLine.snp.makeConstraints { (make) in
            leadingContraint = make.leading.equalTo(safeAreaLayoutGuide.snp.trailing).dividedBy(2).constraint
            trailingConstraint = make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).dividedBy(2).constraint
        }
        
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveLinear, animations: {
            self.layoutIfNeeded()
        }, completion: nil)
    }
    
}
