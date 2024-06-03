//
//  AdTableViewCell.swift
//  TravelMagazine
//
//  Created by 이찬호 on 5/27/24.
//

import UIKit

class AdTableViewCell: UITableViewCell {
    

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var backView: UIView!
    @IBOutlet var adLabel: UILabel!
    
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCell()
    }
    
    private func configureCell () {
        
        backView.layer.cornerRadius = 8
        
        adLabel.textColor = .black
        adLabel.backgroundColor = .white
        adLabel.layer.cornerRadius = 8
    }
    
    func configureData(_ data: Travel) {
        titleLabel.text = data.title
        backView.backgroundColor = data.bgColor
    }
    


    
}
