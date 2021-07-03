//
//  ApiClient.swift
//  TelegramMVVM
//
//  Created by Rustam Keneev on 7/3/21.
//

import Foundation

class ApiClient {
    
    private static let shared = ApiClient()
    
    static func newInstanse() -> ApiClient {
        return shared
    }
}
