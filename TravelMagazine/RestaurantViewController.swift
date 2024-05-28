//
//  RestaurantViewController.swift
//  TravelMagazine
//
//  Created by 이찬호 on 5/26/24.
//

import UIKit
import Kingfisher

class RestaurantViewController: UITableViewController, UISearchBarDelegate {

    private let list = RestaurantList().restaurantArray
    private var filterList = [Restaurant]()
    
    @IBOutlet var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabelView()
        configureNavigationItems()
    }
    
    func configureTabelView() {
        tableView.rowHeight = 120
        filterList = list
    }
    
    func configureNavigationItems() {
        let categories = Array(Set(list.map { $0.category }))
        navigationItem.leftBarButtonItems = [filteringButton("전체")]
        for category in categories {
            navigationItem.leftBarButtonItems?.append(filteringButton(category))
        }
        
    }
    
    func filteringButton(_ title: String) -> UIBarButtonItem {
        let button = UIBarButtonItem(title: title, style: .plain, target: self, action: #selector(filterButtonClicked))
        return button
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterList.count

    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RestaurantCell.identifier, for: indexPath) as? RestaurantCell else {
            return UITableViewCell()
        }
        
        let restaurant = filterList[indexPath.row]
        cell.configureCell(restaurant)
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let text = searchText
        guard text != "" else {
            filterList = list
            tableView.reloadData()
            return
        }
        filterList = list.filter { $0.name.contains(text) || $0.category.contains(text) }
        tableView.reloadData()
    }
    
    @objc func filterButtonClicked(_ sender: UIBarButtonItem) {
        
        guard let category = sender.title , category != "전체" else {
            filterList = list
            tableView.reloadData()
            return
        }
        filterList = list.filter { $0.category == category }
        tableView.reloadData()
    }

}
