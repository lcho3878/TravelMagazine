//
//  PopularCityViewController.swift
//  TravelMagazine
//
//  Created by 이찬호 on 5/27/24.
//

import UIKit
import Kingfisher

class PopularCityViewController: UIViewController {

    private let list = TravelInfo().travel
    
    @IBOutlet var cityTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cityTableView.delegate = self
        cityTableView.dataSource = self
        cityTableView.rowHeight = 120
        let xib = UINib(nibName: "PopularCityTableViewCell", bundle: nil)
        cityTableView.register(xib, forCellReuseIdentifier: "PopularCityTableViewCell")
    }
    
}

extension PopularCityViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PopularCityTableViewCell", for: indexPath) as? PopularCityTableViewCell else {
            return UITableViewCell()
        }
        let data = list[indexPath.row]
        cell.configureData(data)
        return cell
    }
    
    
}
