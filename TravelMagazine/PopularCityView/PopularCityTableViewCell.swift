//
//  PopularCityTableViewCell.swift
//  TravelMagazine
//
//  Created by 이찬호 on 5/29/24.
//

import UIKit
import Kingfisher

class PopularCityTableViewCell: UITableViewCell {
    

    @IBOutlet var cityImageView: UIImageView!
    @IBOutlet var cityTitleLabel: UILabel!
    @IBOutlet var cityDescription: UILabel!
    @IBOutlet var shadowView: UIView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCell()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        cityTitleLabel.textColor = .white
        cityDescription.textColor = .white
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
    
    func configureData(_ data: City, _ searchText: String) {
        cityTitleLabel.attributedText = getHilightedText("\(data.city_name) | \(data.city_english_name)", searchText)
        cityDescription.attributedText = getHilightedText(data.city_explain, searchText)
        cityImageView.kf.setImage(with: URL(string: data.city_image))
    }
    
    private func getHilightedText(_ text: String, _ searchText: String) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: text)
        let range = (text.lowercased() as NSString).range(of: searchText.lowercased())
        if range.location != NSNotFound {
            attributedString.addAttribute(.foregroundColor, value: UIColor.red, range: range)
            attributedString.addAttribute(.backgroundColor, value: UIColor.white, range: range)
        }
        return attributedString
    }
    
}
