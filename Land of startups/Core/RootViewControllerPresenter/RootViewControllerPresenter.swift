//
//  RootViewControllerPresenter.swift
//  LAND OF STARTUPS
//
//  Created by Mirrai Yessilbayeva on 12.04.2023.
//

import UIKit

protocol RootViewControllerPresenter {
    func presentViewController(_ viewController: UIViewController, withAnimations: Bool)
}

final class RootViewControllerPresenterImpl{
    private let window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
    }
}


// MARK: - RootViewControllerPresenter

extension RootViewControllerPresenterImpl: RootViewControllerPresenter{
    func presentViewController(_ viewController: UIViewController, withAnimations: Bool) {
        guard let window else { return }
        window.rootViewController = viewController
        window.overrideUserInterfaceStyle = .light
        window.makeKeyAndVisible()
        if withAnimations {
            UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: nil )
            
        }
    }
}
