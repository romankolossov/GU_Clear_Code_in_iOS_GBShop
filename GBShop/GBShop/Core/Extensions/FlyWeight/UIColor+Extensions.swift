//
//  UIColor+Extensions.swift
//  GBShop
//
//  Created by Roman Kolosov on 10.03.2021.
//

import UIKit

extension UIColor {

    // for TabBar Controller

    static let tabBarBackgroundColor: UIColor = .init(white: 0.1, alpha: 1.0)
    static let tabBarTintColor: UIColor = .systemPurple

    // for Navigation Controllers

    static let  navigationBarLargeTitleTextColor: UIColor = .white
    static let  navigationBarBackgroundColor: UIColor = .init(red: 71 / 255, green: 21 / 255, blue: 111 / 255, alpha: 1.0)

    // for titleLables

    static let  titleLableTextColor: UIColor = .white

    // for view of root VC of Navigation Controllers

    // to make the same color as navigation bar
    // static let rootVCViewBackgroundColor: UIColor = .init(red: 71 / 255, green: 21 / 255, blue: 111 / 255, alpha: 1.0)
    // just purple
    static let rootVCViewBackgroundColor: UIColor = .init(red: 201 / 255, green: 33 / 255, blue: 168 / 255, alpha: 1.0)

    // for User Data

    static let userDataLableTextColor: UIColor = .darkGray
    static let userDataTextFieldTextColor: UIColor = .darkGray

    static let userViewBackgroundColor: UIColor = .white
    // yellow
    static let signUpViewBackgroundColor: UIColor = .init(red: 204 / 255, green: 155 / 255, blue: 33 / 255, alpha: 1.0)
}
