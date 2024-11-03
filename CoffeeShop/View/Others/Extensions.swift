//
//  Extensions.swift
//  CoffeeShop
//
//  Created by Samir iOS on 29/10/24.
//

import UIKit

extension UIView{
    func shadowUIView(offset:CGSize, opacity:Float, radius:CGFloat) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = offset
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
    }
    
    func presentRightLeft(){
        let transition = CATransition()
        transition.duration = 0.3
        transition.timingFunction = .none
        transition.type = .push
        transition.subtype = CATransitionSubtype.fromRight
        self.window!.layer.add(transition, forKey: nil)
    }
    func dismissLeftRight(){
        let transition = CATransition()
        transition.duration = 0.3
        transition.timingFunction = .none
        transition.type = .reveal
        transition.subtype = CATransitionSubtype.fromLeft
        self.window!.layer.add(transition, forKey: nil)
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
         let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
         let mask = CAShapeLayer()
         mask.path = path.cgPath
         layer.mask = mask
     }
}

extension UIColor {
    convenience init(hex: String) {
        let hexString = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        
        if hexString.hasPrefix("#") {
            scanner.currentIndex = hexString.index(after: hexString.startIndex)
        }
        
        var color: UInt64 = 0
        scanner.scanHexInt64(&color)
        
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        
        let red = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue = CGFloat(b) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}

