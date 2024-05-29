//
//  Magazine.swift
//  TravelMagazine
//
//  Created by 이찬호 on 5/25/24.
//

import Foundation
struct Magazine {
    let title: String
    let subtitle: String
    let photo_image: String
    let date: String
    let link: String
    
    var photoURL: URL? {
        guard let url = URL(string: photo_image) else {
            return nil
        }
        return url
    }
    
    var dateString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yymmdd"
        let date = dateFormatter.date(from: date)!
        dateFormatter.dateFormat = "yy년 mm월 dd일"
        let formattedDate = dateFormatter.string(from: date)
        return formattedDate
    }
        
}

