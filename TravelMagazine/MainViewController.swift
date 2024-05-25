//
//  ViewController.swift
//  TravelMagazine
//
//  Created by 이찬호 on 5/25/24.
//

import UIKit

class MainViewController: UIViewController {

    private let magazinInfo = MagazineInfo()
    
    @IBOutlet var magazineTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    private func configureUI() {
        magazineTableView.delegate = self
        magazineTableView.dataSource = self
        navigationItem.title = "SeSAC Travel"
    }

}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height / 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return magazinInfo.magazine.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MagazineTableViewCell", for: indexPath) as? MagazineTableViewCell else { return UITableViewCell()}
        
        cell.subtitleLabel.textColor = .gray
 
        
        
        let magazine = magazinInfo.magazine[indexPath.row]
        
        cell.titleLabel.text = magazine.title
        cell.subtitleLabel.text = magazine.subtitle
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yymmdd"
        if let date = dateFormatter.date(from: magazine.date) {
            dateFormatter.dateFormat = "yy년 mm월 dd일"
            let formattedDate = dateFormatter.string(from: date)
            cell.dateLabel.text = formattedDate
        }

        return cell
    }
    
    
}


