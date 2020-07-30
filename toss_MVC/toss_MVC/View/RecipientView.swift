//
//  RecipientView.swift
//  toss_MVC
//
//  Created by 장창순 on 29/07/2020.
//  Copyright © 2020 AnAppPerTwoWeeks. All rights reserved.
//

import UIKit

class RecipientView: UIView , ScrollMenuBarDelegate {
    
    let menuBar = MenuBarView()
    private let bottomBorder = CALayer()
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.isPagingEnabled = true
        cv.keyboardDismissMode = .interactive
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        dismissKey()
        menuBar.delegate = self
        backgroundColor = .white
        
        addSubview(menuBar)
        menuBar.snp.makeConstraints { (make) in
            make.top.equalTo(safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(60)
        }
        
        addSubview(collectionView)
        collectionView.register(RecentPageCell.self, forCellWithReuseIdentifier: "RecentPageCell")
        collectionView.register(BankListPageCell.self, forCellWithReuseIdentifier: "BankListPageCell")
        collectionView.register(ContactPageCell.self, forCellWithReuseIdentifier: "ContactPageCell")
        
        collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(menuBar.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        menuBar.layer.addSublayer(bottomBorder)
        bottomBorder.backgroundColor = UIColor(red: 241/255, green: 243/255, blue: 245/255, alpha: 1.0).cgColor
        bottomBorder.frame = CGRect(x: 0, y: 59, width: UIScreen.main.bounds.width, height: 1)
    }
    
    private func dismissKey() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer( target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboard() {
        endEditing(true)
    }
    
    func scrollMenuBar(scrollTo index: Int) {
        let indexPath = IndexPath(row: index, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    func scrollPage(_ indexPath: IndexPath) {
        switch (indexPath.row) {
        case 0:
            menuBar.slideMenuBar.snp.updateConstraints { (make) in make.leading.equalTo(0 * menuBar.frame.width / 3.75 + 20) }
        case 1:
            menuBar.slideMenuBar.snp.updateConstraints { (make) in make.leading.equalTo(1 * menuBar.frame.width / 3.75 + 40) }
        case 2:
            menuBar.slideMenuBar.snp.updateConstraints { (make) in make.leading.equalTo(2 * menuBar.frame.width / 3.75 + 60) }
        default:
            menuBar.slideMenuBar.snp.updateConstraints { (make) in make.leading.equalTo(0 * menuBar.frame.width / 3.75 + 20) }
        }
        
        UIView.animate(withDuration: 0.5, delay: 0.3, usingSpringWithDamping: 1, initialSpringVelocity: 17, options: .curveEaseOut, animations: {
            self.layoutIfNeeded()
        }, completion:nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: [])
        }
    }
}
