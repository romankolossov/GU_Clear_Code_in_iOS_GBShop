//
//  UIColor+Extension.swift
//  GBShop
//
//  Created by Roman Kolosov on 10.03.2021.
//

import UIKit

extension UIColor {

    // MARK: - Tab bar controller

    static let tabBarBackgroundColor: UIColor = .init(white: 0.1, alpha: 0.8)
    static let tabBarTintColor: UIColor = .systemPurple

    // MARK: - Navigation controllers and its root VCs

    static let navigationBarLargeTitleTextColor: UIColor = .white
    static let navigationControllerNavigationBarTintColor: UIColor = .white
    static let navigationBarBackgroundColor: UIColor = .init(red: 71 / 255, green: 21 / 255, blue: 111 / 255, alpha: 1.0)

    static let rootVCViewBackgroundColor: UIColor = navigationBarBackgroundColor
    // custom purple
    // static let rootVCViewBackgroundColor: UIColor = .init(red: 201 / 255, green: 33 / 255, blue: 168 / 255, alpha: 1.0)

    // MARK: - Main VC

    // MARK: Goods collection view

    static let goodsCollectionViewBackgroundColor: UIColor = .black

    // MARK: Goods collection view cell

    static let goodsCellBackgroundColor: UIColor = .white
    static let goodsCellBorderColor: UIColor = tabBarTintColor
    static let goodsLableTextColor: UIColor = userLableTextColor

    // MARK: - SignIn and SignUp VCs

    static let userTextFieldTextColor: UIColor = userLableTextColor
    static let userTextFieldTextBackgroundColor: UIColor = .init(white: 0.48, alpha: 0.36)

    // MARK: Buttons

    static let buttonBackgroundColor: UIColor = tabBarBackgroundColor
    static let buttonTitleColor: UIColor = tabBarTintColor
    static let buttonTitleColorWhenHighlighted: UIColor = .systemGreen
    static let buttonBorderColor: UIColor = tabBarTintColor

    // MARK: - Search contrioller

    static let searchTextFieldBackgroundColor: UIColor = tabBarBackgroundColor

    // MARK: - Review VC

    // MARK: Review table view cell

    static let reviewCellBackgroundColor: UIColor = .white
    static let reviewCellBorderColor: UIColor = tabBarTintColor
    static let reviewLableTextColor: UIColor = userLableTextColor

    // MARK: - User VC

    static let userLableTextColor: UIColor = .systemGray6

    // MARK: - for the rest views

    // custom yellow
    static let suplimentaryViewBackgroundColor: UIColor = .init(red: 204 / 255, green: 155 / 255, blue: 33 / 255, alpha: 1.0)

    static let  navigationBarTitleTextColor: UIColor = .white

    // custom purple 2
    static let navigationBarTintColor: UIColor = .init(red: 210 / 255, green: 0 / 255, blue: 185 / 255, alpha: 1.0)

    // MARK: - Alerts

    static let alertTitleTextColor: UIColor = tabBarTintColor
    static let alertViewTintColor: UIColor = tabBarTintColor

    // MARK: Refresh control

    static let refreshControlTintColor: UIColor = .white

}
