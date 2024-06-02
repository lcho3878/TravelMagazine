//
//  OtherChattingTableViewCell.swift
//  TravelMagazine
//
//  Created by 이찬호 on 6/1/24.
//

import UIKit

class OtherChattingTableViewCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var contentLabel: UIPaddingLabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var profileImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
    }
    
    private func configureUI() {
        contentLabel.textAlignment = .left
        contentLabel.numberOfLines = 0
       
        contentLabel.layer.borderColor = UIColor.black.cgColor
        contentLabel.layer.cornerRadius = 8
        contentLabel.clipsToBounds = true
        contentLabel.layer.borderWidth = 1
        
        dateLabel.textColor = .lightGray
        dateLabel.font = .systemFont(ofSize: 13)
        
        profileImageView.contentMode = .scaleAspectFill
    }

    func configreData(_ chat: Chat) {
        nameLabel.text = chat.user.rawValue
        contentLabel.text = chat.message
        dateLabel.text = chat.chatDate

        profileImageView.image = UIImage(named: chat.user.profileImage)
    }
    
}
