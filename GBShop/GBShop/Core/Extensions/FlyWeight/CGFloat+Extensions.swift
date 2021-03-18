//
//  CGFloat+Extensions.swift
//  GBShop
//
//  Created by Roman Kolosov on 17.03.2021.
//

import UIKit

extension CGFloat {

    // MARK: - Main View Controller

    // MARK: for Goods Collection View Cell

    static let goodCellHeight: CGFloat = 120.0
    static let goodCellBorderWidth: CGFloat = 1.7
    static let goodCellCornerRadius: CGFloat = goodCellHeight / 4.8

    // MARK: - for Navigation Bar in SignIn and SignOut VCs

    static let navigationBarHeight: CGFloat = 56.0

    // MARK: - for Buttons in SignIn and SignOut VCs

    static let buttonHeight: CGFloat = navigationBarHeight
    static let buttonBorderWidth: CGFloat = goodCellBorderWidth
    static let buttonCornerRadius: CGFloat = buttonHeight / 4.8
}
