//
//  Coordinator.swift
//  LAND OF STARTUPS
//
//  Created by Mirrai Yessilbayeva on 03.04.2023.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
   // var navigationController: UINavigationController { get set }
    var parentCoordinator: Coordinator? { get set }
    
   // func start()
}

// MARK: - Coordinator

extension Coordinator {
    
    var parentCoordinator: Coordinator? {
        get { return nil }
        set {}
    }
    
    func addChildCoordinator(_ coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }
    
    func removeCoordinator(_ coordinator: Coordinator) {
        childCoordinators = childCoordinators.filter { $0 !== coordinator }
    }
    
    func removeAllCoordinators() {
        childCoordinators.removeAll()
    }
    
    func owner(of coordinator: Coordinator) -> Coordinator? {
        
        if childCoordinators.contains(where: { $0 === coordinator }) {
            return self
        } else {
            for childCoordinator in childCoordinators {
                if let owner = childCoordinator.owner(of: coordinator) {
                    return owner
                }
            }
        }
        return nil
    }
}



