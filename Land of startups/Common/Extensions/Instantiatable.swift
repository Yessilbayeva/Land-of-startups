//
//  Storyboarded.swift
//  LAND OF STARTUPS
//
//  Created by Mirrai Yessilbayeva on 03.04.2023.
//

import UIKit

protocol Instantiatable {
    static func instantiate() -> Self
}


extension Instantiatable where Self: UIViewController {
    
    static func instantiate() -> Self {
        let storyboardName = String(describing: self)
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle.main)
        guard let viewController = storyboard.instantiateInitialViewController() as? Self else {
            fatalError("Failed to instantiate controller \(storyboardName)")
        }
        return viewController
    }
}

extension UIViewController: Instantiatable {}

