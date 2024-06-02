//
//  StringDate.swift
//  TravelMagazine
//
//  Created by 이찬호 on 6/2/24.
//

import UIKit

func StringDate(text: String, originFormat: String, format: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = originFormat
    dateFormatter.locale = Locale(identifier: "ko_KR")
    let date = dateFormatter.date(from: text)!
    dateFormatter.dateFormat = format
    let formattedDate = dateFormatter.string(from: date)
    return formattedDate
}

func getHilightedText(_ text: String, _ searchText: String) -> NSAttributedString {
    let attributedString = NSMutableAttributedString(string: text)
    let range = (text.lowercased() as NSString).range(of: searchText.lowercased())
    if range.location != NSNotFound {
        attributedString.addAttribute(.foregroundColor, value: UIColor.white, range: range)
        attributedString.addAttribute(.backgroundColor, value: UIColor.lightGray, range: range)
    }
    return attributedString
}
