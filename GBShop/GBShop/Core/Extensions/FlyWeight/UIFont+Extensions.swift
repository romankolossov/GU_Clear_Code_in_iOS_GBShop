//
//  UIFont+Extensions.swift
//  GBShop
//
//  Created by Roman Kolosov on 10.03.2021.
//

import UIKit

extension UIFont {

    // MARK: - Main VC

    // MARK: Goods collection view cell

    static let goodsLableFont: UIFont = .preferredFont(forTextStyle: .headline)

    // MARK: - SignIn and SignUp VCs

    static let userTextFieldFont: UIFont = .preferredFont(forTextStyle: .body)

    // MARK: - Review VC

    // MARK: Review table view cell

    static let reviewLableFont: UIFont = goodsLableFont

    // MARK: - User VC

    static let userLableFont: UIFont = .preferredFont(forTextStyle: .body)

    // MARK: - Alerts

    static let alertTitleFont: UIFont = .preferredFont(forTextStyle: .headline)

    // MARK: Refresh Control

    static let refreshControlFont: UIFont = .systemFont(ofSize: 11)
}
