//
//  UIColor+Extensions.swift
//  GBShop
//
//  Created by Roman Kolosov on 10.03.2021.
//

import UIKit

extension UIColor {

    // for TabBar Controller

    static let tabBarBackgroundColor: UIColor = .init(white: 0.2, alpha: 1.0)
    static let tabBarTintColor: UIColor = .systemPurple

    // for Navigation Controllers and its root VCs

    static let  navigationBarLargeTitleTextColor: UIColor = .white
    static let  navigationBarBackgroundColor: UIColor = .init(red: 71 / 255, green: 21 / 255, blue: 111 / 255, alpha: 1.0)

    static let rootVCViewBackgroundColor: UIColor = navigationBarBackgroundColor
    // purple
    // static let rootVCViewBackgroundColor: UIColor = .init(red: 201 / 255, green: 33 / 255, blue: 168 / 255, alpha: 1.0)

    // for Buttons

    static let  buttonTitleColor: UIColor = tabBarTintColor
    static let  buttonTitleColorWhenHighlighted: UIColor = .green

    // for Subviews showing User Data

    static let userLableTextColor: UIColor = .darkGray
    static let userTextFieldTextColor: UIColor = .darkGray

    // for the rest Views

    // yellow
    static let suplimentaryViewBackgroundColor: UIColor = .init(red: 204 / 255, green: 155 / 255, blue: 33 / 255, alpha: 1.0)

    static let  navigationBarTitleTextColor: UIColor = .white

    // purple
    static let  navigationBarTintColor: UIColor = .init(red: 210 / 255, green: 0 / 255, blue: 185 / 255, alpha: 1.0)

}
