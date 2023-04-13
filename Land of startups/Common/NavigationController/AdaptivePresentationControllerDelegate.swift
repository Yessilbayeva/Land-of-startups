//
//  AdaptivePresentationControllerDelegate.swift
//  LAND OF STARTUPS
//
//  Created by Mirrai Yessilbayeva on 13.04.2023.
//

import UIKit

protocol AdaptivePresentationControllerDelegate: UIAdaptivePresentationControllerDelegate {
    var controllerDismissed: ((UIViewController) -> Void)? {get set}
}

final class AdaptivePresentationControllerDelegateImpl: NSObject {
    
    var controllerDismissed: ((UIViewController) -> Void)?
}

extension AdaptivePresentationControllerDelegateImpl: AdaptivePresentationControllerDelegate {
    
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        controllerDismissed?(presentationController.presentedViewController)
    }
}
