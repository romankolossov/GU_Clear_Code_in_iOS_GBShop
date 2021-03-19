//
//  UIFont+Extensions.swift
//  GBShop
//
//  Created by Roman Kolosov on 10.03.2021.
//

import UIKit

extension UIFont {

    // MARK: - Main View Controller

    // MARK: Goods Collection View Cell

    static let goodsLableFont: UIFont = userLableFont

    // MARK: - User View Controller

    static let userLableFont: UIFont = .preferredFont(forTextStyle: .title3)
    static let userTextFieldFont: UIFont = .preferredFont(forTextStyle: .title3)

    // MARK: - Alerts

    static let alertTitleFont: UIFont = .preferredFont(forTextStyle: .headline)

    // MARK: Refresh Control

    static let refreshControlFont: UIFont = .systemFont(ofSize: 12)
}
