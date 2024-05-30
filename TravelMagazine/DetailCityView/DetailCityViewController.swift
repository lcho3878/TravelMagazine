//
//  PopularCityViewController.swift
//  TravelMagazine
//
//  Created by 이찬호 on 5/27/24.
//

import UIKit
import Kingfisher

class DetailCityViewController: UIViewController {

    private var list = TravelInfo().travel
    
    @IBOutlet var detailCityTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    private func configureTableView() {
        detailCityTableView.delegate = self
        detailCityTableView.dataSource = self
        detailCityTableView.rowHeight = 120
        let xib = UINib(nibName: DetailCityTableViewCell.identifier, bundle: nil)
        let xib2 = UINib(nibName: AdTableViewCell.identifier, bundle: nil)
        detailCityTableView.register(xib, forCellReuseIdentifier: DetailCityTableViewCell.identifier)
        detailCityTableView.register(xib2, forCellReuseIdentifier: AdTableViewCell.identifier)
    }
    
}

extension DetailCityViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let data = list[indexPath.row]
        if data.ad {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: AdTableViewCell.identifier, for: indexPath) as? AdTableViewCell else {
                return UITableViewCell()
            }
            cell.configureData(data)
            return cell
        }
        else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailCityTableViewCell.identifier, for: indexPath) as? DetailCityTableViewCell else {
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
            self.detailCityTableView.reloadData()
        }
        let action = UISwipeActionsConfiguration(actions: [delete])
        return action
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let like = UIContextualAction(style: .normal, title: "좋아요") { _,_,_ in
            self.list[indexPath.row].like?.toggle()
            self.detailCityTableView.reloadData()
        }
        let action = UISwipeActionsConfiguration(actions: [like])
        return action
    }
    
    @objc func heartButtonClicked(_ sender: UIButton) {
        list[sender.tag].like?.toggle()
        detailCityTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = list[indexPath.row]
        if data.ad {
            let adVC = storyboard?.instantiateViewController(withIdentifier: "AdViewController") as! AdViewController
            adVC.data = data
            let adNav = UINavigationController(rootViewController: adVC)
            adNav.modalPresentationStyle = .fullScreen
            adNav.modalTransitionStyle = .flipHorizontal
            present(adNav, animated: true)
        }
        else {
            let detailVC = storyboard?.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
            detailVC.data = data
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }
    
    
}
