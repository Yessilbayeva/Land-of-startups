//
//  NavigationControllerDelegate.swift
//  LAND OF STARTUPS
//
//  Created by Mirrai Yessilbayeva on 13.04.2023.
//

import UIKit

protocol NavigationControllerDelegate: UINavigationControllerDelegate {
    var controllerDismissed: ((UIViewController) -> Void)? { get set }
}

final class NavigationControllerDelegateImpl: NSObject, NavigationControllerDelegate {
    
    
    var controllerDismissed: ((UIViewController) -> Void)?
}

extension NavigationControllerDelegateImpl: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController,
                              didShow viewController: UIViewController,
                              animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from),
              !navigationController.viewControllers.contains(fromViewController) else {
            return
        }
        controllerDismissed?(fromViewController)
    }
}
