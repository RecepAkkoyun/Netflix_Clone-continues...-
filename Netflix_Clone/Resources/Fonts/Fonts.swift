//
//  Fonts.swift
//  Netflix_Clone
//
//  Created by Recep Akkoyun on 4.03.2023.
//

import UIKit

final class Font {
    enum FontWeight {
        case regular
        case semibold
        case bold
        case medium
    }

    static func custom(size: CGFloat = 14, fontWeight: FontWeight = .regular) -> UIFont {
        return UIFont(name: "Inter-\(fontWeight)",
                      size: size * UIScreen.main.bounds.height * 0.00115)!
    }
}
