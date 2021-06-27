//
//  ViewController.swift
//  TelegramMVVM
//
//  Created by Rustam Keneev on 6/27/21.
//

import UIKit
import SnapKit
import Kingfisher

class ChatViewController: UIViewController {
    
    private lazy var viewModel: ChatViewModel = {
        return ChatViewModel(delegate: self)
    }()
    
    private lazy var chatTableView: UITableView = {
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        return view
    }()
    
    
    private var chats: [ChatModel] = []

    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModel.loadChat()
    }
    
    private func setupUI(){
        setupAddSubview()
        setupMakeContraints()
    }
    
    func setupAddSubview() {
        view.addSubview(chatTableView)
    }
    
    func setupMakeContraints() {
        chatTableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}


extension ChatViewController: ChatDelegate {
    func showChat(chats: [ChatModel]) {
        self.chats = chats
        self.chatTableView.reloadData()
    }
}


extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.chats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let chat = self.chats[indexPath.row]
        let cell = UITableViewCell()
        cell.textLabel?.text = chat.name
        return cell
    }
    
        

}
