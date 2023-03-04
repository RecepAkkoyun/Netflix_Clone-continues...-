//
//  Onboarding4VC.swift
//  Netflix_Clone
//
//  Created by Recep Akkoyun on 4.03.2023.
//

import UIKit

class Onboarding4VC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = .black
        
        lazy var backgroundImg = UIImageView()
        backgroundImg.image = UIImage(named: "onboarding4")
        view.addSubview(backgroundImg)
        
        backgroundImg.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
        
        lazy var privacyButton = UIButton()
        privacyButton.setTitle("Privacy", for: .normal)
        privacyButton.titleLabel?.font = Font.custom(size: 14,fontWeight: .semibold)
        view.addSubview(privacyButton)
        
        privacyButton.snp.makeConstraints { make in
            make.top.equalTo(view.layoutMarginsGuide)
            make.right.equalTo(-24)
        }
        
        lazy var helpButton = UIButton()
        helpButton.setTitle("Help", for: .normal)
        helpButton.titleLabel?.font = Font.custom(size: 14,fontWeight: .semibold)
        view.addSubview(helpButton)
        
        helpButton.snp.makeConstraints { make in
            make.top.equalTo(view.layoutMarginsGuide)
            make.right.equalTo(privacyButton.snp.left).offset(-16)
        }
        
        lazy var netflixIcon = UIImageView()
        netflixIcon.image = UIImage(named: "netflixIcon")
        view.addSubview(netflixIcon)
        
        netflixIcon.snp.makeConstraints { make in
            make.top.equalTo(view.layoutMarginsGuide)
            make.left.equalTo(24)
        }
        
        lazy var titleLbl = UILabel()
        titleLbl.text = "Unlimited \nentertainment, one \nlow price"
        titleLbl.numberOfLines = 0
        titleLbl.font = Font.custom(size: 30, fontWeight: .bold)
        titleLbl.textAlignment = .center
        backgroundImg.addSubview(titleLbl)
        
        titleLbl.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        lazy var subTitleLbl = UILabel()
        subTitleLbl.text = "Stream and download as much as \nyou want, no extra fees."
        subTitleLbl.font = Font.custom(size: 18, fontWeight: .semibold)
        subTitleLbl.textAlignment = .center
        subTitleLbl.numberOfLines = 0
        backgroundImg.addSubview(subTitleLbl)
        
        subTitleLbl.snp.makeConstraints { make in
            make.top.equalTo(titleLbl.snp.bottom).offset(0.05 * screenHeight)
            make.centerX.equalToSuperview()
        }
        
        lazy var nextButton = UIButton()
        nextButton.setTitle("Start", for: .normal)
        nextButton.backgroundColor = UIColor(named: "buttonColor")
        nextButton.titleLabel?.font = Font.custom(size: 18,fontWeight: .semibold)
        nextButton.layer.cornerRadius = 8
        nextButton.addTarget(self, action: #selector(didTapNext), for: .touchUpInside)
        view.addSubview(nextButton)
        
        nextButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-0.07 * screenHeight)
            make.width.equalTo(0.9 * screenWidth)
            make.centerX.equalToSuperview()
            make.height.equalTo(0.055 * screenHeight)
        }
        
        lazy var sliderImg = UIImageView()
        sliderImg.image = UIImage(named: "page4")
        view.addSubview(sliderImg)
        
        sliderImg.snp.makeConstraints { make in
            make.bottom.equalTo(nextButton.snp.top).offset(-0.05 * screenHeight)
            make.centerX.equalToSuperview()
        }
    }
    
    @objc func didTapNext() {
        Presentation.presentVC(currentVC: self, destinationVC: LoginVC(), toDirection: .down)
    }

}
