//
//  ReusableView.swift
//  LAND OF STARTUPS
//
//  Created by Mirrai Yessilbayeva on 13.04.2023.
//

import Foundation

protocol ReusableView {
    static var reuseIdentifier: String { get }
}

extension ReusableView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
