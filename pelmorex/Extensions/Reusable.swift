//
//  Reusable.swift
//  pelmorex
//
//  Created by Mert Köksal on 3.09.2022.
//

import Foundation

protocol Reusable: class {
    static var reuseIdentifier: String { get }
}

extension Reusable {
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}
