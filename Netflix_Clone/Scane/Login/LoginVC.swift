//
//  LoginVC.swift
//  Netflix_Clone
//
//  Created by Recep Akkoyun on 4.03.2023.
//

import UIKit
import Firebase

class LoginVC: UIViewController,UITextFieldDelegate {
    
    lazy var gmailTextField = UITextField()
    lazy var passwordTextField = UITextField()
    lazy var loginButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        textControl()
        
        passwordTextField.delegate = self
        gmailTextField.delegate = self
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
        
        
        passwordTextField.backgroundColor = UIColor(named: "textFieldColor")
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
        
       
        loginButton.setTitle("Login", for: .normal)
        loginButton.backgroundColor = .clear
        loginButton.layer.borderWidth = 2
        loginButton.layer.cornerRadius = 10
        loginButton.titleLabel?.font = Font.custom(size: 16,fontWeight: .semibold)
        loginButton.layer.borderColor = UIColor.black.cgColor
        loginButton.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
        view.addSubview(loginButton)
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(0.05 * screenHeight)
            make.width.equalTo(0.8 * screenWidth)
            make.centerX.equalToSuperview()
            make.height.equalTo(0.055 * screenHeight)
        }
        
        lazy var recoverBtn = UIButton()
        recoverBtn.setTitle("Recover Password", for: .normal)
        recoverBtn.backgroundColor = .clear
        recoverBtn.titleLabel?.font = Font.custom(size: 16,fontWeight: .semibold)
        view.addSubview(recoverBtn)
        
        recoverBtn.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(0.03 * screenHeight)
            make.width.equalTo(0.8 * screenWidth)
            make.centerX.equalToSuperview()
            make.height.equalTo(0.055 * screenHeight)
        }
    }
    
    @objc func didTapLogin() {
       
        if gmailTextField.text != "" && passwordTextField.text != "" {
            Auth.auth().createUser(withEmail: gmailTextField.text!, password: passwordTextField.text!) { authdata, error in
                if error != nil {
                    self.alertMeesage(title: "Warning!", message: error!.localizedDescription)
                }
                else{
                    Presentation.presentVC(currentVC: self, destinationVC: HomeVC(), toDirection: .up)
                }
            }
        }
        else {
            print("error")
            alertMeesage(title: "Warning!", message: "Email or password is incorrect")
        }
    }
    
    @objc func didTapRecover() {
       
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text == "" {
            // Eğer textfield boş ise, butonu siyah yap
            loginButton.backgroundColor = UIColor.black
        } else {
            // Eğer textfield dolu ise, butonu kırmızı yap
            loginButton.backgroundColor = UIColor.red
        }
    }

    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField.text == "" {
            // Eğer textfield boş ise, butonu siyah yap
            loginButton.backgroundColor = UIColor.black
        } else {
            // Eğer textfield dolu ise, butonu kırmızı yap
            loginButton.backgroundColor = UIColor.red
        }
    }
    
    func textControl() {
        if gmailTextField.text != "" && passwordTextField.text != "" {
            loginButton.backgroundColor = .red
        }
        else{
            loginButton.backgroundColor = .clear
        }
    }
    
    func alertMeesage(title: String, message: String) {
        
        let alertMessage = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default,handler: nil)
        alertMessage.addAction(okButton)
        self.present(alertMessage, animated: true)
    }
    
}
