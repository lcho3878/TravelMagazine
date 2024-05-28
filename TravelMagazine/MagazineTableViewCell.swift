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
        let url = URL(string: magazine.photo_image)
        magazineImageView.kf.setImage(with: url)
        titleLabel.text = magazine.title
        subtitleLabel.text = magazine.subtitle
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yymmdd"
        if let date = dateFormatter.date(from: magazine.date) {
            dateFormatter.dateFormat = "yy년 mm월 dd일"
            let formattedDate = dateFormatter.string(from: date)
            dateLabel.text = formattedDate
        }
    }
    

}
