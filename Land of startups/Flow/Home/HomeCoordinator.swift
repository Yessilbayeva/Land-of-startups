//
//  HomeCoordinator.swift
//  LAND OF STARTUPS
//
//  Created by Mirrai Yessilbayeva on 03.04.2023.
//

import UIKit

protocol HomeCoordinator: Coordinator {
    var rootViewController: UINavigationController { get }
    
    func start()
}

final class HomeCoordinatorImpl {
    
    var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = []
    var rootViewController: UINavigationController {
        return viewController
    }
    
    
    private var viewController: UINavigationController!
//    private var coordinatorDismissObserver: CoordinatorDismissObserver {
//        navigationControllerFlowDismissController.coordinatorDismissObserver
//    }
    
    
}

//extension HomeCoordinatorImpl: HomeCoordinator {
    
//}
