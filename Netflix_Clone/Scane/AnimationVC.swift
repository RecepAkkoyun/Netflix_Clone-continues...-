//
//  LoginVC.swift
//  Netflix_Clone
//
//  Created by Recep Akkoyun on 4.03.2023.
//

import UIKit
import Lottie
import SnapKit

class AnimationVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        
        view.backgroundColor = .black
        
        var animation = LottieAnimationView()
        animation = .init(name: "netflix")
        animation.loopMode = .playOnce
        view.addSubview(animation)
        
        
        animation.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        animation.play {finished in
            Presentation.presentVC(currentVC: self, destinationVC: Onboarding1VC(), toDirection: .down)
        }
        
    }

}
