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
        chats.append(ChatModel(name: "Rustam", lastMessage: "How are you", urlMessage: "https://www.vectorstock.com/royalty-free-vector/king-human-head-logo-icon-design-vector-22441094"))
        chats.append(ChatModel(name: "Rustam", lastMessage: "How are you", urlMessage: "https://www.vectorstock.com/royalty-free-vector/king-human-head-logo-icon-design-vector-22441094"))
        chats.append(ChatModel(name: "Rustam", lastMessage: "How are you", urlMessage: "https://www.vectorstock.com/royalty-free-vector/king-human-head-logo-icon-design-vector-22441094"))
        chats.append(ChatModel(name: "Rustam", lastMessage: "How are you", urlMessage: "https://www.vectorstock.com/royalty-free-vector/king-human-head-logo-icon-design-vector-22441094"))
        chats.append(ChatModel(name: "Rustam", lastMessage: "How are you", urlMessage: "https://www.vectorstock.com/royalty-free-vector/king-human-head-logo-icon-design-vector-22441094"))
        chats.append(ChatModel(name: "Rustam", lastMessage: "How are you", urlMessage: "https://www.vectorstock.com/royalty-free-vector/king-human-head-logo-icon-design-vector-22441094"))
        chats.append(ChatModel(name: "Rustam", lastMessage: "How are you", urlMessage: "https://www.vectorstock.com/royalty-free-vector/king-human-head-logo-icon-design-vector-22441094"))
        chats.append(ChatModel(name: "Rustam", lastMessage: "How are you", urlMessage: "https://www.vectorstock.com/royalty-free-vector/king-human-head-logo-icon-design-vector-22441094"))
        chats.append(ChatModel(name: "Rustam", lastMessage: "How are you", urlMessage: "https://www.vectorstock.com/royalty-free-vector/king-human-head-logo-icon-design-vector-22441094"))
        chats.append(ChatModel(name: "Rustam", lastMessage: "How are you", urlMessage: "https://www.vectorstock.com/royalty-free-vector/king-human-head-logo-icon-design-vector-22441094"))
        chats.append(ChatModel(name: "Rustam", lastMessage: "How are you", urlMessage: "https://www.vectorstock.com/royalty-free-vector/king-human-head-logo-icon-design-vector-22441094"))
        chats.append(ChatModel(name: "Rustam", lastMessage: "How are you", urlMessage: "https://www.vectorstock.com/royalty-free-vector/king-human-head-logo-icon-design-vector-22441094"))
        chats.append(ChatModel(name: "Rustam", lastMessage: "How are you", urlMessage: "https://www.vectorstock.com/royalty-free-vector/king-human-head-logo-icon-design-vector-22441094"))
        chats.append(ChatModel(name: "Rustam", lastMessage: "How are you", urlMessage: "https://www.vectorstock.com/royalty-free-vector/king-human-head-logo-icon-design-vector-22441094"))
        chats.append(ChatModel(name: "Rustam", lastMessage: "How are you", urlMessage: "https://www.vectorstock.com/royalty-free-vector/king-human-head-logo-icon-design-vector-22441094"))
        chats.append(ChatModel(name: "Rustam", lastMessage: "How are you", urlMessage: "https://www.vectorstock.com/royalty-free-vector/king-human-head-logo-icon-design-vector-22441094"))
        
        delegate?.showChat(chats: chats)
    }
}
