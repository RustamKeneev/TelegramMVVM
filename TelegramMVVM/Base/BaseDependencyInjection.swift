//
//  BaseDependencyInjection.swift
//  TelegramMVVM
//
//  Created by Rustam Keneev on 7/3/21.
//

import Foundation
class BaseDependencyInjection<T> {
    
    private var shared: T = return BaseDependencyInjection<T>() as! T
    
    
    static func newInstanse() -> T {
        return shared as! T
    }
}
