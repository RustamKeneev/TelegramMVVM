//
//  MainViewModel.swift
//  TelegramMVVM
//
//  Created by Rustam Keneev on 6/27/21.
//

import Foundation

protocol ChatDelegate: AnyObject {
    func showChat(chats:[ChatModel])
}

class ChatViewModel {
    
    private weak var delegate: ChatDelegate?
    
    private var chats: [ChatModel] = []

    
    init(delegate: ChatDelegate) {
        self.delegate = delegate
    }
    
    func loadChat() {
        chats.append(ChatModel(name: "Rustam", lastMessage: "How are you", urlMessage: "https://who.ca-news.org/people:28159?embed&pack=109"))
        delegate?.showChat(chats: chats)
    }
}
