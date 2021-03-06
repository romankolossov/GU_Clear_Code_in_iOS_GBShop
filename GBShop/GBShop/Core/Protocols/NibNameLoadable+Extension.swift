//
//  NibNameLoadable+Extension.swift
//  GBShop
//
//  Created by Roman Kolosov on 08.04.2021.
//

import UIKit

protocol NibNameLoadable where Self: UIResponder { }

extension NibNameLoadable {
    static var nibName: String? {
        NSStringFromClass(self).components(separatedBy: ".").last
    }
}
