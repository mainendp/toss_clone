//
//  MainNavigationController.swift
//  toss_MVC
//
//  Created by 장창순 on 06/07/2020.
//  Copyright © 2020 AnAppPerTwoWeeks. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.tintColor = UIColor(red: 38/255, green: 48/255, blue: 63/255, alpha: 1.0)
        navigationBar.backgroundColor = .clear
        let attributes = [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Medium", size: 17)!]
        UINavigationBar.appearance().titleTextAttributes = attributes
    }
    
}
