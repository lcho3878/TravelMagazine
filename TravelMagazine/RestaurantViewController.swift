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
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantList.restaurantArray.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height / 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell", for: indexPath) as? RestaurantCell else {
            return UITableViewCell()
        }
        
        let restaurant = restaurantList.restaurantArray[indexPath.row]
        let url = URL(string: restaurant.image)
        cell.restaurantImageView.kf.setImage(with: url)
        cell.restaurantTitle.text = restaurant.name
        cell.restaurantSubtitle.numberOfLines = 0
        cell.restaurantSubtitle.text = restaurant.category
        cell.restaurantAdress.text = restaurant.address
        return cell
    }

}
