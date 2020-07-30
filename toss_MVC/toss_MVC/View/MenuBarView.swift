//
//  MenuBarView.swift
//  toss_MVC
//
//  Created by 장창순 on 07/07/2020.
//  Copyright © 2020 AnAppPerTwoWeeks. All rights reserved.
//

import UIKit
import SnapKit

class MenuBarView: UIView {
    
    weak var delegate: ScrollMenuBarDelegate?
    private let menuList = ["최근목록","계좌","연락처"]
    let slideMenuBar = UIView()
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 17.5
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setFirstIndexAsSelected()
    }
    
    private func setupUI() {
        backgroundColor = .white
        
        addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: "MenuCell")
        collectionView.backgroundColor = .white
        collectionView.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        addSubview(slideMenuBar)
        slideMenuBar.backgroundColor = .black
        slideMenuBar.layer.cornerRadius = 2
        slideMenuBar.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.snp.bottom)
            make.leading.equalToSuperview().offset(20)
            make.width.equalTo(self.snp.width).dividedBy(3.75)
            make.height.equalTo(3)
        }
    }
    
    private func setFirstIndexAsSelected() {
        let selectedIndexPath = IndexPath(item: 0, section: 0)
        collectionView.selectItem(at: selectedIndexPath, animated: false, scrollPosition: .bottom)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MenuBarView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let menuCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: indexPath) as? MenuCell else { return UICollectionViewCell() }
        menuCell.updateCell("\(menuList[indexPath.row])")
        return menuCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width / 3.75, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch (indexPath.item) {
        case 0:
            slideMenuBar.snp.updateConstraints { (make) in make.leading.equalTo(0 * frame.width / 3.75 + 20) }
        case 1:
            slideMenuBar.snp.updateConstraints { (make) in make.leading.equalTo(1 * frame.width / 3.75 + 37.5) }
        case 2:
            slideMenuBar.snp.updateConstraints { (make) in make.leading.equalTo(2 * frame.width / 3.75 + 57.5) }
        default:
            slideMenuBar.snp.updateConstraints { (make) in make.leading.equalTo(0 * frame.width / 3.75 + 20) }
        }
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 17, options: .curveEaseOut, animations: {
            self.layoutIfNeeded()
        }, completion: nil)
        
        delegate?.scrollMenuBar(scrollTo: indexPath.row)
        
    }
    
}
