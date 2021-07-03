//
//  RegisterViewController.swift
//  TelegramMVVM
//
//  Created by Rustam Keneev on 7/1/21.
//

import Foundation
import UIKit
import SnapKit
import FirebaseAuth

class RegisterViewController: UIViewController {
        
    private lazy var viewModel: RegisterViewModel = {
        return RegisterViewModel(delegate: self)
    }()
       
    private let emailField: UITextField = {
        let view = UITextField()
        view.autocapitalizationType = .none
        view.autocorrectionType = .no
        view.returnKeyType = .continue
        view.layer.cornerRadius = 12
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.placeholder = "Email Address"
        view.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        view.leftViewMode = .always
        view.backgroundColor = .white
        return view
    }()
       
    private let FirstNameField: UITextField = {
        let view = UITextField()
        view.autocapitalizationType = .none
        view.autocorrectionType = .no
        view.returnKeyType = .continue
        view.layer.cornerRadius = 12
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.placeholder = "First Name"
        view.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        view.leftViewMode = .always
        view.backgroundColor = .white
        return view
    }()
       
    private let lastNameField: UITextField = {
        let view = UITextField()
        view.autocapitalizationType = .none
        view.autocorrectionType = .no
        view.returnKeyType = .continue
        view.layer.cornerRadius = 12
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.placeholder = "Last Name"
        view.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        view.leftViewMode = .always
        view.backgroundColor = .white
        return view
    }()
       
    private let passwordField: UITextField = {
        let view = UITextField()
        view.autocapitalizationType = .none
        view.autocorrectionType = .no
        view.returnKeyType = .done
        view.layer.cornerRadius = 12
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.placeholder = "Password"
        view.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        view.leftViewMode = .always
        view.backgroundColor = .white
        view.isSecureTextEntry = true
        return view
    }()
       
    private let registerButton: UIButton = {
        let view = UIButton()
        view.setTitle("Log In", for: .normal)
        view.backgroundColor = .link
        view.setTitleColor(.white, for: .normal)
        view.layer.cornerRadius = 12
        view.layer.masksToBounds = true
        view.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        view.addTarget(self,action: #selector(registerButtonTapped),for: .touchUpInside)
        return view
    }()
       
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Register"
        configure()
    }
    
    func configure() {
        setupAddSubViews()
        setupMakeContraints()
    }
    func setupAddSubViews() {
        view.addSubview(FirstNameField)
        view.addSubview(lastNameField)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(registerButton)
    }
    
    func setupMakeContraints() {
        FirstNameField.snp.makeConstraints{ (make) in
            make.right.equalToSuperview().offset(-20)
            make.left.equalToSuperview().offset(20)
            make.bottom.equalTo(lastNameField.snp.top).offset(-10)
            make.width.equalTo(view.frame.width / 1.0)
            make.height.equalTo(50)
        }

        lastNameField.snp.makeConstraints{ (make) in
            make.right.equalToSuperview().offset(-20)
            make.left.equalToSuperview().offset(20)
            make.bottom.equalTo(emailField.snp.top).offset(-10)
            make.width.equalTo(view.frame.width / 1.0)
            make.height.equalTo(50)
        }
                
        emailField.snp.makeConstraints{ (make) in
            make.right.equalToSuperview().offset(-20)
            make.left.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
            make.width.equalTo(view.frame.width / 1.0)
            make.height.equalTo(50)
        }
                
        passwordField.snp.makeConstraints{ (make) in
            make.right.equalToSuperview().offset(-20)
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(emailField.snp.bottom).offset(10)
            make.width.equalTo(view.frame.width / 1.0)
            make.height.equalTo(50)
        }
                
        registerButton.snp.makeConstraints{ (make) in
            make.right.equalToSuperview().offset(-20)
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(passwordField.snp.bottom).offset(10)
            make.width.equalTo(view.frame.width / 1.0)
            make.height.equalTo(50)
        }
    }
    
    @objc private func registerButtonTapped(){
            viewModel.register(password: passwordField.text ?? String(), email: emailField.text ?? String(), lastName: String(), fertsName: String())
        }
}

extension RegisterViewController: RegisterDelegate{
    func registerSucces() {
        navigationController?.pushViewController(ChatViewController(), animated: true)
    }
    
    func registerError(message: String) {
        print(message)
    }
}
