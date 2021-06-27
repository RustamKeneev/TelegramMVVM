//
//  ChatModel.swift
//  TelegramMVVM
//
//  Created by Rustam Keneev on 6/27/21.
//

import Foundation

class ChatModel {
    var name: String
    var lastMessage: String
    var urlMessage: String
    
    init(name:String, lastMessage: String, urlMessage:String) {
        self.name = name
        self.lastMessage = lastMessage
        self.urlMessage = urlMessage
    }
}
