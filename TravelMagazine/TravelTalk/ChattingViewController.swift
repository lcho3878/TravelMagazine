//
//  SingleChattingViewController.swift
//  TravelMagazine
//
//  Created by 이찬호 on 6/1/24.
//

import UIKit

class ChattingViewController: UIViewController {
    
    var chatRoom: ChatRoom!
    @IBOutlet var chattingTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureNavigationItems()
    }
    
    private func configureNavigationItems() {
        navigationItem.title = chatRoom.chatroomImage.count == 1 ? chatRoom.chatroomName : "그룹 채팅"
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.topItem?.title = ""
    }
    
    private func configureTableView() {
        chattingTableView.rowHeight = UITableView.automaticDimension
        chattingTableView.delegate = self
        chattingTableView.dataSource = self
        chattingTableView.separatorColor = .clear
        chattingTableView.register(UINib(nibName: MyChattingTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: MyChattingTableViewCell.identifier)
        chattingTableView.register(UINib(nibName: OtherChattingTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: OtherChattingTableViewCell.identifier)
    }


}

extension ChattingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatRoom.chatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let chat = chatRoom.chatList[indexPath.row]
        if chat.user == .user {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MyChattingTableViewCell.identifier, for: indexPath) as? MyChattingTableViewCell else {
                return UITableViewCell()
            }
            cell.configureData(chat: chat)
            return cell
        }
        else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: OtherChattingTableViewCell.identifier, for: indexPath) as? OtherChattingTableViewCell else {
                return UITableViewCell()
            }
            cell.configreData(chat)
            return cell
        }

    }
    
    
}
