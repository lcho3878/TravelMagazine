//
//  PopularCityViewController.swift
//  TravelMagazine
//
//  Created by 이찬호 on 5/27/24.
//

import UIKit
import Kingfisher

class PopularCityViewController: UIViewController {

    private var list = TravelInfo().travel
    
    @IBOutlet var cityTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cityTableView.delegate = self
        cityTableView.dataSource = self
        cityTableView.rowHeight = 120
        let xib = UINib(nibName: "PopularCityTableViewCell", bundle: nil)
        let xib2 = UINib(nibName: "AdTableViewCell", bundle: nil)
        cityTableView.register(xib, forCellReuseIdentifier: "PopularCityTableViewCell")
        cityTableView.register(xib2, forCellReuseIdentifier: "AdTableViewCell")
    }
    
}

extension PopularCityViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let data = list[indexPath.row]
        if data.ad {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AdTableViewCell", for: indexPath) as? AdTableViewCell else {
                return UITableViewCell()
            }
            cell.titleLabel.text = data.title
            return cell
        }
        else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PopularCityTableViewCell", for: indexPath) as? PopularCityTableViewCell else {
                return UITableViewCell()
            }
            cell.heartButton.tag = indexPath.row
            cell.heartButton.addTarget(self, action: #selector(heartButtonClicked), for: .touchUpInside)
            cell.configureData(data)
            return cell
        }

    }
    
    @objc func heartButtonClicked(_ sender: UIButton) {
        list[sender.tag].like?.toggle()
        cityTableView.reloadData()
    }
    
    
}