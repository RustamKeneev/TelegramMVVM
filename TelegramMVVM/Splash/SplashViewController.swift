//
//  SplashViewController.swift
//  TelegramMVVM
//
//  Created by Rustam Keneev on 6/29/21.
//

import Foundation
import SnapKit
import UIKit

class SplashViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.pushViewController(ChatViewController(), animated: true)
        
    }
    
}
