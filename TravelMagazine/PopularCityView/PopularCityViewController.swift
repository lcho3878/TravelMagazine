//
//  PopularCityViewController.swift
//  TravelMagazine
//
//  Created by 이찬호 on 5/29/24.
//

import UIKit

class PopularCityViewController: UIViewController {
//    private let list = CityInfo().city
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var segmentControl: UISegmentedControl!
    @IBOutlet var cityTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureTableView()
    }
    
    private func configureUI() {
        navigationItem.title = "인기 도시"
        

        segmentControl.setTitle("모두", forSegmentAt: 0)
        segmentControl.setTitle("국내", forSegmentAt: 1)
        segmentControl.insertSegment(withTitle: "해외", at: 2, animated: false)
    }
    
    private func configureTableView() {
        cityTableView.delegate = self
        cityTableView.dataSource = self
        let xib = UINib(nibName: PopularCityTableViewCell.identifier, bundle: nil)
        cityTableView.register(xib, forCellReuseIdentifier: PopularCityTableViewCell.identifier)
        
        cityTableView.rowHeight = view.frame.height / 6
    }

}

extension PopularCityViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PopularCityTableViewCell.identifier, for: indexPath) as? PopularCityTableViewCell else {
            return UITableViewCell()
        }
        
        
        return cell
    }
    
}
