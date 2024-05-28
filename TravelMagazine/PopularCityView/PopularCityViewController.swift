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
        configureTableView()
    }
    
    private func configureTableView() {
        cityTableView.delegate = self
        cityTableView.dataSource = self
        cityTableView.rowHeight = 120
        let xib = UINib(nibName: PopularCityTableViewCell.identifier, bundle: nil)
        let xib2 = UINib(nibName: AdTableViewCell.identifier, bundle: nil)
        cityTableView.register(xib, forCellReuseIdentifier: PopularCityTableViewCell.identifier)
        cityTableView.register(xib2, forCellReuseIdentifier: AdTableViewCell.identifier)
    }
    
}

extension PopularCityViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let data = list[indexPath.row]
        if data.ad {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: AdTableViewCell.identifier, for: indexPath) as? AdTableViewCell else {
                return UITableViewCell()
            }
            cell.titleLabel.text = data.title
            return cell
        }
        else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PopularCityTableViewCell.identifier, for: indexPath) as? PopularCityTableViewCell else {
                return UITableViewCell()
            }
            cell.heartButton.tag = indexPath.row
            cell.heartButton.addTarget(self, action: #selector(heartButtonClicked), for: .touchUpInside)
            cell.configureData(data)
            return cell
        }

    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "삭제") { _,_,_ in
            self.list.remove(at: indexPath.row)
            self.cityTableView.reloadData()
        }
        let action = UISwipeActionsConfiguration(actions: [delete])
        return action
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let like = UIContextualAction(style: .normal, title: "좋아요") { _,_,_ in
            self.list[indexPath.row].like?.toggle()
            self.cityTableView.reloadData()
        }
        let action = UISwipeActionsConfiguration(actions: [like])
        return action
    }
    
    @objc func heartButtonClicked(_ sender: UIButton) {
        list[sender.tag].like?.toggle()
        cityTableView.reloadData()
    }
    
    
    
    
}
