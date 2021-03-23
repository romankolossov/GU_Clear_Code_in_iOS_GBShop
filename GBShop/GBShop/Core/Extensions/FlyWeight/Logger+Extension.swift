//
//  Logger+Extension.swift
//  GBShop
//
//  Created by Roman Kolosov on 23.03.2021.
//

import Foundation
import OSLog

extension Logger {
    private static var subsystem = Bundle.main.bundleIdentifier ?? ""

    // Logs the view cycles like viewDidLoad
    static let viewCycle = Logger(subsystem: subsystem, category: "viewCycle")
}
