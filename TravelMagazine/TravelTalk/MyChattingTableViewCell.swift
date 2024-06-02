//
//  MyChattingTableViewCell.swift
//  TravelMagazine
//
//  Created by 이찬호 on 6/1/24.
//

import UIKit

class MyChattingTableViewCell: UITableViewCell {

    @IBOutlet var contentLabel: UIPaddingLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()

    }
    
    private func configureUI() {
        contentLabel.textAlignment = .right
        contentLabel.numberOfLines = 0
        
        contentLabel.backgroundColor = .lightGray
        contentLabel.layer.borderColor = UIColor.gray.cgColor
        contentLabel.layer.cornerRadius = 8
        contentLabel.clipsToBounds = true
        contentLabel.layer.borderWidth = 1
    }
    
    func configureData(chat: Chat) {
        contentLabel.text = chat.message
    }
    
}
