//
//  TravelTalkTableViewCell.swift
//  TravelMagazine
//
//  Created by 이찬호 on 6/1/24.
//

import UIKit

class TravelTalkTableViewCell: UITableViewCell {

    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var contentLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
    }
    
    private func configureUI() {
        nameLabel.font = .boldSystemFont(ofSize: 15)
        
        dateLabel.font = .systemFont(ofSize: 14)
        contentLabel.textColor = .gray
        
        dateLabel.font = .systemFont(ofSize: 14)
        dateLabel.textColor = .gray
    }
    
    func configureCell(_ chatRoom: ChatRoom) {
        let sub = chatRoom.chatroomImage.count == 1 ? "" : "단톡방입니다."
        nameLabel.text = chatRoom.chatroomName + sub
        contentLabel.text = chatRoom.chatList.last?.message
        dateLabel.text = chatRoom.chatList.last?.date
    }
}
