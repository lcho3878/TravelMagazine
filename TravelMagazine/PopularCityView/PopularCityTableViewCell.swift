//
//  PopularCityTableViewCell.swift
//  TravelMagazine
//
//  Created by 이찬호 on 5/29/24.
//

import UIKit

class PopularCityTableViewCell: UITableViewCell {
    
    static let identifier = "PopularCityTableViewCell"

    @IBOutlet var cityImageView: UIImageView!
    @IBOutlet var cityTitleLabel: UILabel!
    @IBOutlet var cityDescription: UILabel!
    @IBOutlet var shadowView: UIView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
