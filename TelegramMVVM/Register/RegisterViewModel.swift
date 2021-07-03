//
//  RegisterViewModel.swift
//  TelegramMVVM
//
//  Created by Rustam Keneev on 7/3/21.
//

import Foundation

import FirebaseAuth

protocol RegisterDelegate: AnyObject {
    func registerSucces()
    func registerError(message: String)
}

class RegisterViewModel: BaseViewModel {
    
    private weak var delegate: RegisterDelegate?
    
    init(delegate: RegisterDelegate) {
        self.delegate = delegate
    }
    
    func register(password: String, email: String, lastName: String, fertsName: String) {
        FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password, completion: {authResult, error in
            guard let result = authResult , error == nil else {
                self.delegate?.registerError(message: "error creating user")
                return
            }
            
            self.delegate?.registerSucces()
        })
    }
}
