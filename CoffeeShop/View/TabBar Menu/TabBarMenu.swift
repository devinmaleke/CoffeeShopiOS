//
//  File.swift
//  CoffeeShop
//
//  Created by Samir iOS on 29/10/24.
//

import UIKit

class TabBarMenu: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.shadowUIView(offset: .zero, opacity: 0.15, radius: 2)
        tabBar.roundCorners(corners:  [.topLeft, .topRight], radius: 12)
        initialUI()
    }
    
    private func initialUI() {
        let vc1 = HomeVC()
        let vc2 = HomeVC()
        let vc3 = HomeVC()
        let vc4 = HomeVC()
        
        tabBar.backgroundColor = .white
        setViewControllers([vc1, vc2, vc3, vc4], animated: true)
        
        // Define font and color attributes
        let normalAttributes = [
            NSAttributedString.Key.font: UIFont(name: "Poppins-Regular", size: 11) ?? UIFont.systemFont(ofSize: 11),
            NSAttributedString.Key.foregroundColor: UIColor.gray
        ]
        let selectedAttributes = [
            NSAttributedString.Key.font: UIFont(name: "Poppins-Regular", size: 11) ?? UIFont.systemFont(ofSize: 11),
            NSAttributedString.Key.foregroundColor: UIColor(hex: "#1B66FF")
        ]
        
        // Home
        if let homeTabBarItem = tabBar.items?[0] {
            homeTabBarItem.image = UIImage(named: "Home0")?.withRenderingMode(.alwaysOriginal)
            homeTabBarItem.selectedImage = UIImage(named: "Home1")?.withRenderingMode(.alwaysOriginal)
            homeTabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            homeTabBarItem.setTitleTextAttributes(normalAttributes, for: .normal)
            homeTabBarItem.setTitleTextAttributes(selectedAttributes, for: .selected)
        }
        
        // Bill
        if let billTabBarItem = tabBar.items?[1] {
            billTabBarItem.image = UIImage(named: "Love0")?.withRenderingMode(.alwaysOriginal)
            billTabBarItem.selectedImage = UIImage(named: "Love1")?.withRenderingMode(.alwaysOriginal)
            billTabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            billTabBarItem.setTitleTextAttributes(normalAttributes, for: .normal)
            billTabBarItem.setTitleTextAttributes(selectedAttributes, for: .selected)
        }
        
        // Inquiry
        if let inquiryTabBarItem = tabBar.items?[2] {
            inquiryTabBarItem.image = UIImage(named: "Bag0")?.withRenderingMode(.alwaysOriginal)
            inquiryTabBarItem.selectedImage = UIImage(named: "Bag1")?.withRenderingMode(.alwaysOriginal)
            inquiryTabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            inquiryTabBarItem.setTitleTextAttributes(normalAttributes, for: .normal)
            inquiryTabBarItem.setTitleTextAttributes(selectedAttributes, for: .selected)
        }
        
        // Notification
        if let notificationTabBarItem = tabBar.items?[3] {
            notificationTabBarItem.image = UIImage(named: "Notif0")?.withRenderingMode(.alwaysOriginal)
            notificationTabBarItem.selectedImage = UIImage(named: "Notif1")?.withRenderingMode(.alwaysOriginal)
            notificationTabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            notificationTabBarItem.setTitleTextAttributes(normalAttributes, for: .normal)
            notificationTabBarItem.setTitleTextAttributes(selectedAttributes, for: .selected)
        }
        
        modalPresentationStyle = .fullScreen
        modalTransitionStyle = .crossDissolve
    }
}

