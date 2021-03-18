//
//  UIFont+Extensions.swift
//  GBShop
//
//  Created by Roman Kolosov on 10.03.2021.
//

import UIKit

extension UIFont {

    // MARK: - for User Data

    static let userLableFont: UIFont = .preferredFont(forTextStyle: .title3)
    static let userTextFieldFont: UIFont = .preferredFont(forTextStyle: .title3)

    // MARK: for Goods Collection View Cell

    static let goodsLableFont: UIFont = userLableFont

    // MARK: - for Alerts

    static let alertTitleFont: UIFont = .preferredFont(forTextStyle: .headline)

    // MARK: Reserve
    // for RefreshControl

    // static let refreshControlFont: UIFont = .systemFont(ofSize: 10)
}
