//
//  AdTableViewCell.swift
//  TravelMagazine
//
//  Created by 이찬호 on 5/27/24.
//

import UIKit

class AdTableViewCell: UITableViewCell {
    
    static let identifier = "AdTableViewCell"

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var backView: UIView!
    @IBOutlet var adLabel: UILabel!
    
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCell()
    }
    
    private func configureCell () {
        backView.backgroundColor = RandomColor()
        backView.layer.cornerRadius = 8
        
        adLabel.textColor = .black
        adLabel.backgroundColor = .white
        adLabel.layer.cornerRadius = 8
    }
    
    func configureData(_ data: Travel) {
        titleLabel.text = data.title
    }
    
    func RandomColor() -> UIColor {
        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        return color
    }

    
}
