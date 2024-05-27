//
//  PopularCityTableViewCell.swift
//  TravelMagazine
//
//  Created by 이찬호 on 5/27/24.
//

import UIKit

class PopularCityTableViewCell: UITableViewCell {

    @IBOutlet var mainImageView: UIImageView!
    @IBOutlet var mainTitle: UILabel!
    @IBOutlet var subTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureLayout()
    }
    
    func configureLayout() {
        mainTitle.font = .boldSystemFont(ofSize: 17)
        
        subTitle.textColor = .lightGray
        subTitle.font = .systemFont(ofSize: 13)
        
        mainImageView.layer.cornerRadius = 8
        mainImageView.contentMode = .scaleAspectFill
    }
    
    func configureData(_ data: Travel) {
        if let url = data.travel_image {
            mainImageView.kf.setImage(with: URL(string: url))
        }
        mainTitle.text = data.title
        subTitle.text = data.description
    }
    
}
