//
//  PopularCityTableViewCell.swift
//  TravelMagazine
//
//  Created by 이찬호 on 5/29/24.
//

import UIKit
import Kingfisher

class PopularCityTableViewCell: UITableViewCell {
    
    static let identifier = "PopularCityTableViewCell"

    @IBOutlet var cityImageView: UIImageView!
    @IBOutlet var cityTitleLabel: UILabel!
    @IBOutlet var cityDescription: UILabel!
    @IBOutlet var shadowView: UIView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCell()
    }
    
    private func configureCell() {
        cityTitleLabel.textColor = .white
        cityTitleLabel.font = .boldSystemFont(ofSize: 20)
        
        cityDescription.textColor = .white
        cityDescription.font = .systemFont(ofSize: 14)
        
        cityImageView.contentMode = .scaleAspectFill
        cityImageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
        cityImageView.layer.cornerRadius = 16
        
        shadowView.backgroundColor = .black
        shadowView.layer.opacity = 0.4
        shadowView.layer.maskedCorners = [.layerMaxXMaxYCorner]
        shadowView.layer.cornerRadius = 16
    }
    
    func configureData(_ data: City) {
        cityTitleLabel.text = "\(data.city_name) | \(data.city_english_name)"
        cityDescription.text = data.city_explain
        cityImageView.kf.setImage(with: URL(string: data.city_image))
    }
    
}
