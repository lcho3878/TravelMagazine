//
//  UIViewController+Extension.swift
//  TravelMagazine
//
//  Created by 이찬호 on 6/1/24.
//

import UIKit

extension UIViewController: ReuseIdentifier {
    
    static var identifier: String {
        return String(describing: self)
    }
    
}

protocol ReuseIdentifier {
    
    static var identifier: String { get }
    
}
