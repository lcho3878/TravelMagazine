//
//  TravelTalkViewController.swift
//  TravelMagazine
//
//  Created by 이찬호 on 6/1/24.
//

import UIKit

class TravelTalkViewController: UIViewController {
    
    let chatList = mockChatList
    var filterList: [ChatRoom] = []{
        didSet{
            talkTableView.reloadData()
        }
    }

    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var talkTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filterList = chatList
        configureTableView()
    }

    private func configureTableView() {
        talkTableView.rowHeight = 80
        talkTableView.delegate = self
        talkTableView.dataSource = self
        talkTableView.register(UINib(nibName: TravelTalkTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: TravelTalkTableViewCell.identifier)
    }
}

extension TravelTalkViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TravelTalkTableViewCell.identifier, for: indexPath) as? TravelTalkTableViewCell else {
            return UITableViewCell()
        }
        cell.profileImageView.backgroundColor = .blue
        
        let chatRoom = filterList[indexPath.row]
        cell.configureCell(chatRoom)
        
        return cell
    }
    
    
}

