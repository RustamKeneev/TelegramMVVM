//
//  BaseViewModel.swift
//  TelegramMVVM
//
//  Created by Rustam Keneev on 7/3/21.
//

import Foundation

class BaseViewModel {
    
}

extension BaseViewModel {
    var repository: Repository { get { Repository.newInstanse() } }
    var apiClient: ApiClient { get { ApiClient.newInstanse() } }
}
