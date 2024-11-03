//
//  OnBoardingVC.swift
//  CoffeeShop
//
//  Created by Samir iOS on 29/10/24.
//

import UIKit

class OnBoardingVC: UIViewController {

    @IBOutlet weak var imageHeight: NSLayoutConstraint!

    @IBOutlet weak var bgContentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    
    @IBAction func didTapButton(_ sender: Any) {
        self.navigationController?.pushViewController(TabBarMenu(), animated: true)
    }
    
    private func setupUI(){
        imageHeight.constant = UIScreen.main.bounds.height / 1.8
        bgContentView.backgroundColor = .black
    }

    
}
