//
//  LoginViewController.swift
//  TelegramMVVM
//
//  Created by Rustam Keneev on 7/1/21.
//

import Foundation
import UIKit
import SnapKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    private lazy var viewModel: LoginViewModel = {
        return LoginViewModel(delegate: self)
    }()
        
    private lazy var logoImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "telegramm")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private lazy var emailAddressTextField: UITextField = {
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
    
    private lazy var passwordTextField: UITextField = {
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
    
    private lazy var loginButton: UIButton = {
        let view = UIButton()
        view.setTitle("Log In", for: .normal)
        view.backgroundColor = .link
        view.setTitleColor(.white, for: .normal)
        view.layer.cornerRadius = 12
        view.layer.masksToBounds = true
        view.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        view.addTarget(self, action: #selector(loginButtonTarget), for: .touchUpInside)
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Log In"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Register",
                                                                    style: .done,
                                                                    target: self,
                                                                    action: #selector(didTapRegister))
        configure()
    }
    
    func configure() {
        setupAddSubViews()
        setupMakeContraints()
        
        navigationItem.hidesBackButton = true
        navigationItem.backBarButtonItem?.isEnabled = false
        navigationController?.navigationItem.backBarButtonItem?.isEnabled = false

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
        emailAddressTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        viewModel.login(password: passwordTextField.text ?? String(), email: emailAddressTextField.text ?? String())
    }
    
    @objc func didTapRegister(){
            let vc = RegisterViewController()
            navigationController?.pushViewController(vc, animated: true)
        }
}


extension LoginViewController: LoginDelegate {
    func loginSucces() {
        navigationController?.pushViewController(ChatViewController(), animated: true)
    }
    
    func loginError(message: String) {
        print(message)
    }
}
