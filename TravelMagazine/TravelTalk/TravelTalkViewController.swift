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
        configureTableView()
        configureSearchBar()
    }

    private func configureTableView() {
        filterList = chatList
        talkTableView.rowHeight = 80
        talkTableView.delegate = self
        talkTableView.dataSource = self
        talkTableView.register(UINib(nibName: TravelTalkTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: TravelTalkTableViewCell.identifier)
    }
    
    private func configureSearchBar() {
        searchBar.delegate = self
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chatRoom = filterList[indexPath.row]
        let sb = UIStoryboard(name: "Chatting", bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: ChattingViewController.identifier) as? ChattingViewController else { return }
        vc.chatRoom = chatRoom
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension TravelTalkViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard searchText != "" else {
            filterList = chatList
            return
        }
        filterList = chatList.filter {
            $0.chatList.contains(where: {
                $0.user.rawValue.contains(searchText)
            })
        }
    }
}
