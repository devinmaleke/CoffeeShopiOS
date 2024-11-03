//
//  ViewController.swift
//  CoffeeShop
//
//  Created by Samir iOS on 29/10/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let onBoardingVC = OnBoardingVC()
        navigationController?.pushViewController(onBoardingVC, animated: true)
    }


}

