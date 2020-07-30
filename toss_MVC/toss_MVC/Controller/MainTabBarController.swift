//
//  MainTabBarController.swift
//  toss_MVC
//
//  Created by 장창순 on 06/07/2020.
//  Copyright © 2020 AnAppPerTwoWeeks. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    private func setupTabBar() {
        tabBar.unselectedItemTintColor = .black
        tabBar.tintColor = UIColor(red: 49/255, green: 130/255, blue: 246/255, alpha: 1.0)
        
        let mainViewController = MainViewController()
        let secondViewController = SecondViewController()
        let thirdViewController = ThirdViewController()
        let fourthViewController = FourthViewController()
        
        viewControllers = [
            generateNavigationController(rootViewController: mainViewController, title: "홈", image: "home"),
            generateNavigationController(rootViewController: secondViewController, title: "내 소비", image: "calendar"),
            generateNavigationController(rootViewController: thirdViewController, title: "추천", image: "favorite"),
            generateNavigationController(rootViewController: fourthViewController, title: "전체", image: "hamburger")
        ]
    }
    
    private func generateNavigationController(rootViewController: UIViewController, title: String, image: String) -> UIViewController {
        
        let navigationVC = MainNavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = UIImage(named: image)
        navigationVC.tabBarItem.selectedImage = UIImage(named: "\(image)Selected")
        
        return navigationVC
    }
}

