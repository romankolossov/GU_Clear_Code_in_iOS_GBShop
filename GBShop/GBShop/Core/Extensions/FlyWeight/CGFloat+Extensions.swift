//
//  CGFloat+Extensions.swift
//  GBShop
//
//  Created by Roman Kolosov on 17.03.2021.
//

import UIKit

extension CGFloat {

    // MARK: - Main View Controller

    // MARK: Goods Collection View Cell

    static let goodCellHeight: CGFloat = 120.0
    static let goodCellBorderWidth: CGFloat = 1.7
    static let goodCellCornerRadius: CGFloat = goodCellHeight / 8.8

    // MARK: - SignIn and SignUp VCs

    static let textFieldCornerRadius: CGFloat = 6.8

    // MARK: Navigation Bar

    static let navigationBarHeight: CGFloat = 56.0

    // MARK: Buttons

    static let buttonHeight: CGFloat = navigationBarHeight
    static let buttonBorderWidth: CGFloat = goodCellBorderWidth
    static let buttonCornerRadius: CGFloat = buttonHeight / 4.8
}
