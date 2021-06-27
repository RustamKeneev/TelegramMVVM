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
    
    private lazy var title: UILabel = {
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
        return view
    }()
    
    
    
    override func onViewLoaded(){
        
    }
    func fill(chat:ChatModel) {
         
    }
}
