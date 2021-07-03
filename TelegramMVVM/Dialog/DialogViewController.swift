//
//  DialogViewController.swift
//  TelegramMVVM
//
//  Created by Rustam Keneev on 6/28/21.
//

import Foundation
import UIKit

class DialogViewController: UIViewController {
    
    var message: [String] = []
        
    static func newInstanse(chat: ChatModel) -> DialogViewController {
        let viewController = DialogViewController()
        viewController.viewModel.fill(chat: chat)
        return viewController
    }
        
    private lazy var viewModel: DialogViewModel = {
        return DialogViewModel(delegate: self)
    }()
        
    private lazy var messageView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
        
    private lazy var enterMessage: UITextField = {
        let view = UITextField()
        view.backgroundColor = .white
        view.placeholder = "message"
        view.layer.cornerRadius = 8
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 0))
        view.leftView = paddingView
        view.leftViewMode = .always
        return view
    }()
        
    private lazy var sendButton: UIButton = {
        let view = UIButton()
        view.backgroundColor = .lightGray
        view.setTitleColor(.blue, for: .normal)
        view.setTitle("Send", for: .normal)
        view.addTarget(self, action: #selector(clickSendMessage(view:)), for: .touchUpInside)
        return view
    }()
        
    private lazy var messageTableView: UITableView = {
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        return view
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = .white
        setupAddSubview()
        setupMakeContraints()
    }
    
    func setupAddSubview() {
        view.addSubview(messageView)
        messageView.addSubview(sendButton)
        messageView.addSubview(enterMessage)
        view.addSubview(messageTableView)
    }
    
    func setupMakeContraints() {
        
        messageView.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(50)
        }
        
        sendButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-8)
            make.right.equalToSuperview().offset(-8)
            make.width.equalTo(45)
        }
        
        enterMessage.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-8)
            make.left.equalToSuperview().offset(8)
            make.right.equalTo(sendButton.snp.left).offset(-8)
        }
        
        messageTableView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.bottom.equalTo(messageView.snp.top)
        }
    }
    
    @objc func clickSendMessage(view: UIButton) {
          let messageSend = enterMessage.text ?? String()
          enterMessage.text = String()
          message.append(messageSend)
          
          messageTableView.reloadData()
      }
}

extension DialogViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.message.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let messageCell = UITableViewCell()
        messageCell.textLabel?.text = self.message[indexPath.row]
        return messageCell
    }
}


extension DialogViewController: DialogDelegate {
    func fillData(chat: ChatModel?) {
        self.title = chat?.name
    }
    
    func showData() {
        
    }
}
