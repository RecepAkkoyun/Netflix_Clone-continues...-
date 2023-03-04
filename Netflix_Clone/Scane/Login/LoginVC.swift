//
//  LoginVC.swift
//  Netflix_Clone
//
//  Created by Recep Akkoyun on 4.03.2023.
//

import UIKit

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    func setupUI() {
        view.backgroundColor = UIColor(named: "backgroundColor")
        
        lazy var netflixIcon = UIImageView()
        netflixIcon.image = UIImage(named: "nxlogo")
        view.addSubview(netflixIcon)
        
        netflixIcon.snp.makeConstraints { make in
            make.top.equalTo(0.35 * screenHeight)
            make.centerX.equalToSuperview()
            make.width.equalTo(0.6 * screenWidth)
            make.height.equalTo(0.17 * screenWidth)
        }
                
        lazy var helpButton = UIButton()
        helpButton.setTitle("Help", for: .normal)
        helpButton.titleLabel?.font = Font.custom(size: 14,fontWeight: .semibold)
        view.addSubview(helpButton)
        
        helpButton.snp.makeConstraints { make in
            make.top.equalTo(view.layoutMarginsGuide)
            make.right.equalToSuperview().offset(-24)
        }
        
        lazy var gmailTextField = UITextField()
        gmailTextField.backgroundColor = UIColor(named: "textFieldColor")
        gmailTextField.layer.cornerRadius = 10
        gmailTextField.placeholder = "Enter Email or Contact Number"
        gmailTextField.textColor = UIColor(red: 0.658, green: 0.658, blue: 0.658, alpha: 1)
        
        //Textfieldin solundan 16 birim uzakta yazmaya başlıyorum
        lazy var leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: gmailTextField.frame.height))
        gmailTextField.leftView = leftView
        gmailTextField.leftViewMode = .always
        view.addSubview(gmailTextField)
        
        gmailTextField.snp.makeConstraints { make in
            make.top.equalTo(netflixIcon.snp.bottom).offset(0.1 * screenHeight)
            make.width.equalTo(0.8 * screenWidth)
            make.centerX.equalToSuperview()
            make.height.equalTo(0.055 * screenHeight)
        }
        
        lazy var passwordTextField = UITextField()
        passwordTextField.backgroundColor = .darkGray
        passwordTextField.placeholder = "Enter New Password"
        passwordTextField.textColor = UIColor(red: 0.658, green: 0.658, blue: 0.658, alpha: 1)
        passwordTextField.layer.cornerRadius = 10
        lazy var passLeftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: passwordTextField.frame.height))
        passwordTextField.leftView = passLeftView
        passwordTextField.leftViewMode = .always
        view.addSubview(passwordTextField)

        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(gmailTextField.snp.bottom).offset(0.05 * screenHeight)
            make.width.equalTo(0.8 * screenWidth)
            make.centerX.equalToSuperview()
            make.height.equalTo(0.055 * screenHeight)
        }
        
        lazy var loginButton = UIButton()
        loginButton.setTitle("Login", for: .normal)
        loginButton.backgroundColor = .clear
        loginButton.layer.borderWidth = 2
        loginButton.layer.cornerRadius = 10
        loginButton.titleLabel?.font = Font.custom(size: 16,fontWeight: .semibold)
        loginButton.layer.borderColor = UIColor.black.cgColor
        view.addSubview(loginButton)
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(0.05 * screenHeight)
            make.width.equalTo(0.8 * screenWidth)
            make.centerX.equalToSuperview()
            make.height.equalTo(0.055 * screenHeight)
        }
        
        
        
        
        
        
        
        
        
    }
    
}
