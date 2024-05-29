//
//  AdViewController.swift
//  TravelMagazine
//
//  Created by 이찬호 on 5/29/24.
//

import UIKit

class AdViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationItems()
    }
    
    private func configureNavigationItems() {
        navigationItem.title = "광고 화면"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(backVC))
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
    @objc func backVC() {
        dismiss(animated: true)
    }
}



