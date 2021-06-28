//
//  DialogViewController.swift
//  TelegramMVVM
//
//  Created by Rustam Keneev on 6/28/21.
//

import Foundation
import UIKit

class DialogViewController: UIViewController {
    
    static func newInstance(chat: ChatModel) -> DialogViewController{
        let viewController = DialogViewController()
        viewController.chat = chat
        return viewController
    }
    
    private lazy var viewModel: DialogViewModel = {
        return DialogViewModel(delegate: self)
    }()
    
    private var chat: ChatModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        title = chat?.name
    }
    
    func setupUI() {
        view.backgroundColor = .white
        setupAddSubview()
        setupMakeContraints()
    }
    
    func setupAddSubview() {
        
    }
    
    func setupMakeContraints() {
        
    }
}

extension DialogViewController: DialogDelegate {
    func showData() {
        
    }
}
