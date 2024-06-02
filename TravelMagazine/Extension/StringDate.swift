//
//  StringDate.swift
//  TravelMagazine
//
//  Created by 이찬호 on 6/2/24.
//

import Foundation

func StringDate(text: String, originFormat: String, format: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = originFormat
    dateFormatter.locale = Locale(identifier: "ko_KR")
    let date = dateFormatter.date(from: text)!
    dateFormatter.dateFormat = format
    let formattedDate = dateFormatter.string(from: date)
    return formattedDate
}
