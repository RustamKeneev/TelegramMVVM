//
//  ChatCell.swift
//  TelegramMVVM
//
//  Created by Rustam Keneev on 6/27/21.
//

import Foundation
import SnapKit
import UIKit
import Kingfisher

class ChatCell: BaseCell {
    
    private lazy var name: UILabel = {
        let view = UILabel()
        view.textColor = .black
        return view
    }()
    
    private lazy var lastMessage: UILabel = {
        let view = UILabel()
        view.textColor = .black
        return view
    }()
    
    private lazy var userImage: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .blue
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 25
        return view
    }()
    
    private lazy var separator: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    override func addSubviews(){
        setupAddSubview()
        setupMakeContraints()
    }
    
    func setupAddSubview() {
        addSubview(separator)
        addSubview(userImage)
        addSubview(name)
        addSubview(lastMessage)
    }
    
    func setupMakeContraints() {
       
        userImage.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
            make.height.width.equalTo(50)
        }
        
        name.snp.makeConstraints { (make) in
            make.left.equalTo(userImage.snp.right).offset(10)
            make.top.equalToSuperview().offset(6)
        }
        
        separator.snp.makeConstraints { (make) in
            make.height.equalTo(1)
            make.right.equalToSuperview().offset(-6)
            make.left.equalTo(name.snp.left)
            make.bottom.equalToSuperview()
        }
        
        lastMessage.snp.makeConstraints { (make) in
            make.left.equalTo(userImage.snp.right).offset(10)
            make.top.equalTo(name.snp.bottom).offset(6)
        }
    }
    
    
    func fill(chat:ChatModel) {
        userImage.kf.setImage(with: URL(string: chat.urlMessage))
        name.text = chat.name
        lastMessage.text = chat.lastMessage
        
    }
}
