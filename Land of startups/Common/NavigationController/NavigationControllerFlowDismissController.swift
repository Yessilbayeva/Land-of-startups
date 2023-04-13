//
//  NavigationControllerFlowDismissController.swift
//  LAND OF STARTUPS
//
//  Created by Mirrai Yessilbayeva on 13.04.2023.
//

import Foundation

protocol NavigationControllerFlowDismissController: AnyObject {
    var coordinatorDismissObserver: NavigationControllerFlowDismissObserver { get }

}

final class NavigationControllerFlowDismissControllerImpl: NavigationControllerFlowDismissController{
    
    let coordinatorDismissObserver: NavigationControllerFlowDismissObserver
    
    init(coordinatorDismissObserver: NavigationControllerFlowDismissObserver) {
        self.coordinatorDismissObserver = coordinatorDismissObserver
        coordinatorDismissObserver.delegate = self
    }
    
    convenience init() {
        self.init(coordinatorDismissObserver: NavigationControllerFlowDismissObserverImpl())
    }
}

extension NavigationControllerFlowDismissControllerImpl: NavigationControllerFlowDismissObserverDelegate {
    func navigationControllerFlowDismissObserver(_ observer: NavigationControllerFlowDismissObserver,
                                                 didObserveDismissOfCoordinators
                                                 coordinators: [Coordinator]) {
        coordinators.forEach {
            assert($0.parentCoordinator != nil, "Parent coordinator doesn't exists")
            $0.parentCoordinator?.removeCoordinator($0)
        }
    }
}
