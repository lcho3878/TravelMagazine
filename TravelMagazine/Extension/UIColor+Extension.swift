//
//  UIColor+Extension.swift
//  TravelMagazine
//
//  Created by 이찬호 on 6/3/24.
//

import UIKit

extension UIColor {
    static var random: UIColor {
        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        return color
    }
}
