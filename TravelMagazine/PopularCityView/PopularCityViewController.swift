//
//  PopularCityViewController.swift
//  TravelMagazine
//
//  Created by 이찬호 on 5/29/24.
//

import UIKit

class PopularCityViewController: UIViewController {
    private let list = CityInfo().city
    private var filterLIst = [City]()
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var segmentControl: UISegmentedControl!
    @IBOutlet var cityTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureSegmentControl()
        configureTableView()
        searchBar.delegate = self
    }
    
    private func configureUI() {
        navigationItem.title = "인기 도시"
        filterLIst = list
    }
    
    private func configureSegmentControl() {
        segmentControl.setTitle("모두", forSegmentAt: 0)
        segmentControl.setTitle("국내", forSegmentAt: 1)
        segmentControl.insertSegment(withTitle: "해외", at: 2, animated: false)
        
        let action1 = actionWithTitle("모두")
        let action2 = actionWithTitle("국내")
        let action3 = actionWithTitle("해외")
        segmentControl.setAction(action1, forSegmentAt: 0)
        segmentControl.setAction(action2, forSegmentAt: 1)
        segmentControl.setAction(action3, forSegmentAt: 2)
    }
    
    private func actionWithTitle(_ title: String) -> UIAction {
        let action = UIAction(title: title) { _ in
            self.filterWithSegmentControl()
            self.cityTableView.reloadData()
        }
        return action
    }
    
    private func filterWithSegmentControl() {
        guard let category = segmentControl.titleForSegment(at: segmentControl.selectedSegmentIndex) else { return }
        switch category {
        case "모두": filterLIst = list
        case "국내": filterLIst = list.filter { $0.domestic_travel == true }
        case "해외": filterLIst = list.filter { $0.domestic_travel == false }
        default: break
        }
        guard let keyword = searchBar.text, keyword != "" else { return }
        filterWithKeyword(keyword)
    }
    
    private func filterWithKeyword(_ keyword: String) {
        guard keyword != "" else {
            return
        }
        filterLIst = filterLIst.filter { $0.city_name.contains(keyword) || $0.city_english_name.contains(keyword) || $0.city_explain.contains(keyword)}
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
        return filterLIst.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PopularCityTableViewCell.identifier, for: indexPath) as? PopularCityTableViewCell else {
            return UITableViewCell()
        }
        let data = filterLIst[indexPath.row]
        cell.configureData(data)
        
        return cell
    }
    
}

extension PopularCityViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard searchText != "" else {
            filterWithSegmentControl()
            cityTableView.reloadData()
            return
        }
        filterWithSegmentControl()
        filterWithKeyword(searchText)
        cityTableView.reloadData()
    }
}
