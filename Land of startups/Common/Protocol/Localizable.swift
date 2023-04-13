//
//  Localizable.swift
//  LAND OF STARTUPS
//
//  Created by Mirrai Yessilbayeva on 13.04.2023.
//

import Foundation

protocol Localizable {
    var localized: String { get }
}

extension Localizable where Self: RawRepresentable {
    var localized: String {
        getString(for: self.rawValue as! String)
    }
    
    private func getString(for key: String) -> String {
        return Bundle.main.localizedString(forKey: key, value: nil, table: String(describing: type(of: self)))
    }
}
