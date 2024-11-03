//
//  PickerCVC.swift
//  CoffeeShop
//
//  Created by Samir iOS on 29/10/24.
//

import UIKit

class PickerCVC: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 15
    }

    func setup(title: String){
        titleLabel.text = title
    }
    
    func setSelected(_ isSelected: Bool) {
        if isSelected{
            selected()
        } else{
            notSeleceted()
        }
    }
    
    func selected(){
        backgroundColor = UIColor.init(hex: "C67C4E")
        titleLabel.textColor = UIColor.init(hex: "FFFFFF")
    }
    
    func notSeleceted(){
      backgroundColor = UIColor.init(hex: "EDEDED")
        titleLabel.textColor = UIColor.init(hex: "313131")
    }
    
    
}
