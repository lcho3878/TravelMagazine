//
//  AdViewController.swift
//  TravelMagazine
//
//  Created by 이찬호 on 5/29/24.
//

import UIKit

class AdViewController: UIViewController {
    
    var data: Travel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationItems()
        view.backgroundColor = data?.bgColor
    }
    
    private func configureNavigationItems() {
        navigationItem.title = data?.title
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(backVC))
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
    @objc func backVC() {
        dismiss(animated: true)
    }
}



