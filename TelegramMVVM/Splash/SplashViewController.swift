//
//  SplashViewController.swift
//  TelegramMVVM
//
//  Created by Rustam Keneev on 6/29/21.
//

import Foundation
import Firebase

class SplashViewCotroller: UIViewController {
    
    private lazy var viewModel: SplashViewModel = {
        return SplashViewModel(delegate: self)
    }()
    
    override func viewDidLoad() {
        viewModel.checkUser()
    }
}

extension SplashViewCotroller: SplashDelegate {
    func showMain() {
        navigationController?.pushViewController(ChatViewController(), animated: true)
    }
    
    func showAuth() {
        navigationController?.pushViewController(LoginViewController(), animated: true)
    }
}
