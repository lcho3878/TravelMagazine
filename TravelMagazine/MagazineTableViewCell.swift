//
//  MagazineTableViewCell.swift
//  TravelMagazine
//
//  Created by 이찬호 on 5/25/24.
//

import UIKit

class MagazineTableViewCell: UITableViewCell {
    
    static let identifier = "MagazineTableViewCell"

    @IBOutlet var magazineImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCell()
    }
    
    private func configureCell() {
        titleLabel.font = .boldSystemFont(ofSize: 20)
        titleLabel.numberOfLines = 0
        
        subtitleLabel.textColor = .gray
        subtitleLabel.font = .systemFont(ofSize: 16)
        subtitleLabel.numberOfLines = 0
        
        dateLabel.font = .systemFont(ofSize: 16)
        dateLabel.textColor = .gray
        
        magazineImageView.contentMode = .scaleAspectFill
        magazineImageView.layer.cornerRadius = 16
    }
    
    func configureData(_ magazine: Magazine) {
        magazineImageView.kf.setImage(with: magazine.photoURL)
        titleLabel.text = magazine.title
        subtitleLabel.text = magazine.subtitle
        dateLabel.text = magazine.dateString
    }
    

}
