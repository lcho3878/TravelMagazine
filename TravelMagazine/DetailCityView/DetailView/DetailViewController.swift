//
//  DetailViewController.swift
//  TravelMagazine
//
//  Created by 이찬호 on 5/29/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    var data: Travel?
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationItems()
        configureUI()
        
    }
    
    private func configureNavigationItems() {
        navigationItem.title = data?.title
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.topItem?.title = ""
    }
    
    private func configureUI() {
        titleLabel.text = data?.title
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 17)
        
        
        descriptionLabel.text = data?.description
        descriptionLabel.font = .systemFont(ofSize: 13)
        descriptionLabel.textColor = .lightGray
    }
  

}
