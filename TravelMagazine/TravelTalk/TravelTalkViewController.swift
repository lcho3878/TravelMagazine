//
//  TravelTalkViewController.swift
//  TravelMagazine
//
//  Created by 이찬호 on 6/1/24.
//

import UIKit
import SnapKit

class TravelTalkViewController: UIViewController {
    
    let chatList = mockChatList
    var filterList: [ChatRoom] = mockChatList{
        didSet {
            updateSnapshot()
        }
    }
    
    private var dataSource: UICollectionViewDiffableDataSource<String, ChatRoom>!
    
    private let layout = {
        var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        configuration.showsSeparators = false
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        return layout
    }()
    
    private lazy var talkCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)

    @IBOutlet var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSearchBar()
        configureDataSource()
        updateSnapshot()
        view.addSubview(talkCollectionView)
        talkCollectionView.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom)
            $0.horizontalEdges.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    
}

extension TravelTalkViewController {
    private func configureDataSource() {
        var registration: UICollectionView.CellRegistration<UICollectionViewListCell, ChatRoom>!
        registration = UICollectionView.CellRegistration{ cell, indexPath, chatroom in
            var content = UIListContentConfiguration.valueCell()
            content.text = chatroom.chatroomName
            content.secondaryText = chatroom.chatList.last?.message
            if chatroom.chatroomImage.count == 1 {
                content.image = UIImage(named: chatroom.chatroomImage.first ?? "")
            }
            content.imageToTextPadding = 10
            
            cell.contentConfiguration = content
        }
        
        dataSource = UICollectionViewDiffableDataSource(collectionView: talkCollectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueConfiguredReusableCell(using: registration, for: indexPath, item: itemIdentifier)
            return cell
        })
    }
    
    private func updateSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<String, ChatRoom>()
        snapshot.appendSections(["talk"])
        snapshot.appendItems(filterList, toSection: "talk")
        dataSource.apply(snapshot)
    }
    
 
}


extension TravelTalkViewController: UISearchBarDelegate {
    private func configureSearchBar() {
        searchBar.delegate = self
        searchBar.placeholder = "친구 이름을 검색해보세요"
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard searchText != "" else {
            filterList = chatList
            return
        }
        filterList = chatList.filter {
            $0.chatList.contains(where: {
                $0.user.rawValue.contains(searchText)
            }) || $0.chatroomName.contains(searchText)
            
        }
    }
}
