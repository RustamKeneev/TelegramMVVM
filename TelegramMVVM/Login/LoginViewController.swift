//
//  LoginViewController.swift
//  TelegramMVVM
//
//  Created by Rustam Keneev on 7/1/21.
//

import Foundation
import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    private lazy var logoImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "telegramm")
        return view
    }()
    
    private lazy var emailAddressTextField: UITextField = {
        let view = UITextField()
        view.placeholder = "Email Address"
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        return view
    }()
    
    private lazy var passwordTextField: UITextField = {
        let view = UITextField()
        view.placeholder = "Password"
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.addTarget(self, action: #selector(loginButtonTarget), for: .touchUpInside)
        return view
    }()
    
    private lazy var loginButton: UIButton = {
        let view = UIButton()
        view.backgroundColor = .blue
        view.setTitle("Login in", for: .normal)
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        
        configure()
    }
    
    func configure() {
        setupAddSubViews()
        setupMakeContraints()
    }
    
    func setupAddSubViews() {
        view.addSubview(logoImage)
        view.addSubview(emailAddressTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
    }
    
    func setupMakeContraints() {
        
        logoImage.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(120)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(120)
        }
        
        emailAddressTextField.snp.makeConstraints { (make) in
            make.top.equalTo(logoImage.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
        
        passwordTextField.snp.makeConstraints { (make) in
            make.top.equalTo(emailAddressTextField.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
        
        loginButton.snp.makeConstraints { (make) in
            make.top.equalTo(passwordTextField.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
    }
    
    @objc func loginButtonTarget(button: UIButton){
        print("button select \(button.tag)")
    }
}
