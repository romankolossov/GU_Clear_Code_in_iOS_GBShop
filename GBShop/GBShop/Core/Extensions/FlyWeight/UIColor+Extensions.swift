//
//  UIColor+Extensions.swift
//  GBShop
//
//  Created by Roman Kolosov on 10.03.2021.
//

import UIKit

extension UIColor {

    // MARK: - for TabBar Controller

    static let tabBarBackgroundColor: UIColor = .init(white: 0.1, alpha: 0.8)
    static let tabBarTintColor: UIColor = .systemPurple

    // MARK: - for Navigation Controllers and its root VCs

    static let navigationBarLargeTitleTextColor: UIColor = .white
    static let navigationBarBackgroundColor: UIColor = .init(red: 71 / 255, green: 21 / 255, blue: 111 / 255, alpha: 1.0)

    static let rootVCViewBackgroundColor: UIColor = navigationBarBackgroundColor
    // custom purple
    // static let rootVCViewBackgroundColor: UIColor = .init(red: 201 / 255, green: 33 / 255, blue: 168 / 255, alpha: 1.0)

    // MARK: - Main View Controller

    // MARK: for Collection View of goods

    static let goodsCollectionViewBackgroundColor: UIColor = .black

    // MARK: for Goods Collection View Cell

    static let goodsCellBackgroundColor: UIColor = .white
    static let goodsCellborderColor: UIColor = tabBarTintColor
    static let goodsLableTextColor: UIColor = userLableTextColor

    // MARK: - for Buttons in SignIn and SignOut VCs

    static let buttonBackgroundColor: UIColor = tabBarBackgroundColor
    static let buttonTitleColor: UIColor = tabBarTintColor
    static let buttonTitleColorWhenHighlighted: UIColor = .systemGreen
    static let buttonBorderColor: UIColor = tabBarTintColor

    // MARK: - for Subviews showing User Data

    static let userLableTextColor: UIColor = .systemGray3
    static let userTextFieldTextColor: UIColor = .systemGray3

    // MARK: - for the rest Views

    // custom yellow
    static let suplimentaryViewBackgroundColor: UIColor = .init(red: 204 / 255, green: 155 / 255, blue: 33 / 255, alpha: 1.0)

    static let  navigationBarTitleTextColor: UIColor = .white

    // custom purple 2
    static let navigationBarTintColor: UIColor = .init(red: 210 / 255, green: 0 / 255, blue: 185 / 255, alpha: 1.0)

    // MARK: - for Alerts

    static let alertTitleTextColor: UIColor = tabBarTintColor
    static let alertViewTintColor: UIColor = tabBarTintColor

    // MARK: for Refresh Control

    static let refreshControlTintColor: UIColor = .white

}
