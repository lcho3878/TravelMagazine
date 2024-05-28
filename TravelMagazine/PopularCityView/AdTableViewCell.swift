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
        // Initialization code
        backView.backgroundColor = RandomColor()
        backView.layer.cornerRadius = 8
        
        adLabel.textColor = .black
        adLabel.backgroundColor = .white
        adLabel.layer.cornerRadius = 8
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func RandomColor() -> UIColor {
        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        return color
    }

    
}
