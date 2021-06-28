//
//  DialogViewModel.swift
//  TelegramMVVM
//
//  Created by Rustam Keneev on 6/28/21.
//

import Foundation

protocol DialogDelegate: AnyObject {
    func showData()
}

class DialogViewModel {
    
    private weak var delegate: DialogDelegate?
    private var chat: ChatModel?
    
    init(delegate: DialogDelegate) {
        self.delegate = delegate
    }
    
    func fill(chat: ChatModel) {
        
    }
    
}
