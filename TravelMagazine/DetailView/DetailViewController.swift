//
//  DetailViewController.swift
//  TravelMagazine
//
//  Created by 이찬호 on 5/29/24.
//

import UIKit

class DetailViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationItems()
        
    }
    
    private func configureNavigationItems() {
        navigationItem.title = "관광지화면"
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.topItem?.title = ""
    }
  

}
