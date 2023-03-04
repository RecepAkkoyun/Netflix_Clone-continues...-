//
//  ScreenW-H.swift
//  Netflix_Clone
//
//  Created by Recep Akkoyun on 4.03.2023.
//

import UIKit

extension UIViewController {
    var screenHeight: CGFloat {
        return view.frame.size.height
    }

    var screenWidth: CGFloat {
        return view.frame.size.width
    }

    var stringMultiplier: CGFloat {
        return 0.00115 * self.screenHeight
    }
}
