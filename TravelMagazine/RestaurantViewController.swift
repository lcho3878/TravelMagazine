//
//  RestaurantViewController.swift
//  TravelMagazine
//
//  Created by 이찬호 on 5/26/24.
//

import UIKit
import Kingfisher

class RestaurantViewController: UITableViewController {

    private let restaurantList = RestaurantList()
    private var filterList = [Restaurant]()
    @IBOutlet var searchButton: UIButton!
    @IBOutlet var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filterList = restaurantList.restaurantArray

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterList.count

    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height / 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell", for: indexPath) as? RestaurantCell else {
            return UITableViewCell()
        }
        
        let restaurant = filterList[indexPath.row]
        let url = URL(string: restaurant.image)
        cell.restaurantImageView.kf.setImage(with: url)
        cell.restaurantTitle.text = restaurant.name
        cell.restaurantSubtitle.numberOfLines = 0
        cell.restaurantSubtitle.text = restaurant.category
        cell.restaurantAdress.text = restaurant.address
        return cell
    }

    @IBAction func searchButtonClicked(_ sender: UIButton) {
        filterList = restaurantList.restaurantArray
        guard let category = searchTextField.text, category != "" else {
            return
        }
        filterList = filterList.filter { $0.category == category }
        tableView.reloadData()
    }
}
