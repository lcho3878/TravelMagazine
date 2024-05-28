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
        subtitleLabel.textColor = .gray
        magazineImageView.contentMode = .scaleAspectFill
    }
    
    func configureData(_ magazine: Magazine) {
        magazineImageView.kf.setImage(with: magazine.photoURL)
        titleLabel.text = magazine.title
        subtitleLabel.text = magazine.subtitle
        dateLabel.text = magazine.dateString
    }
    

}
