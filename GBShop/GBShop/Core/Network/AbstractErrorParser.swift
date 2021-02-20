//
//  AbstractErrorParser.swift
//  GBShop
//
//  Created by Roman Kolosov on 17.02.2021.
//

import Foundation

protocol AbstractErrorParser {
    func parse(_ result: Error) -> Error
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error?
}
