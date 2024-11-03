//
//  CardCVC.swift
//  CoffeeShop
//
//  Created by Samir iOS on 31/10/24.
//

import UIKit

class CardCVC: UICollectionViewCell {

    @IBOutlet weak var bgView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        bgView.layer.cornerRadius = 8
    }

}
