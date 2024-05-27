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
    @IBOutlet var starStackView: UIStackView!
    @IBOutlet var saveCountLabel: UILabel!
    @IBOutlet var heartButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureLayout()
    }
    
    func configureLayout() {
        mainTitle.font = .boldSystemFont(ofSize: 17)
        
        subTitle.textColor = .lightGray
        subTitle.font = .systemFont(ofSize: 13)
        
        saveCountLabel.textColor = .lightGray
        saveCountLabel.font = .systemFont(ofSize: 13)
        
        mainImageView.layer.cornerRadius = 8
        mainImageView.contentMode = .scaleAspectFill

    }
    
    func configureData(_ data: Travel) {
        if let url = data.travel_image {
            mainImageView.kf.setImage(with: URL(string: url))
        }
        mainTitle.text = data.title
        subTitle.text = data.description
        
        if let grade = data.grade {
            fillStars(grade)
        }
        if let save = data.save {
            saveCountLabel.text = "저장 \(save.formatted())"
        }
        
        if let like = data.like {
            let tintColor = like ? UIColor.red : UIColor.lightGray
            let alpha = like ? 1 : 0.4
            heartButton.tintColor = tintColor
            heartButton.alpha = alpha
        }
        
    }
    
    func fillStars(_ grade: Double) {
        let count = Int(grade)
        for (i, item) in starStackView.subviews.enumerated() {
            if i + 1 > count {
                break
            }
            let imageView = item as! UIImageView
            imageView.image = UIImage(systemName: "star.fill")
        }
    }
    
}
