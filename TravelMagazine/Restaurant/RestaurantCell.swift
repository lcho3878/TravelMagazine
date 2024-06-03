//
//  RestaurantCell.swift
//  TravelMagazine
//
//  Created by 이찬호 on 5/26/24.
//

import UIKit
import Kingfisher

class RestaurantCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var mainImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureLayout()
    }

    func configureLayout() {
        titleLabel.font = .boldSystemFont(ofSize: 17)
        
        subtitleLabel.font = .systemFont(ofSize: 14)
        subtitleLabel.textColor = .darkGray
        subtitleLabel.numberOfLines = 0
        
        descriptionLabel.font = .boldSystemFont(ofSize: 20)
        descriptionLabel.textColor = .blue
        
        mainImageView.backgroundColor = .lightGray
        mainImageView.contentMode = .scaleAspectFill
    }
    
    func configureCell(_ data: Restaurant) {
        titleLabel.text = data.titleText
        subtitleLabel.text = data.address
        descriptionLabel.text = data.price.formatted() + "원"
        let url = URL(string: data.image)
        mainImageView.kf.setImage(with: url, placeholder: UIImage(systemName: "star"))
       
    }
    
}
