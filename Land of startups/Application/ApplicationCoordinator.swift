//
//  ApplicationCoordinator.swift
//  LAND OF STARTUPS
//
//  Created by Mirrai Yessilbayeva on 03.04.2023.
//
import UIKit

protocol ApplicationCoordinator: Coordinator {
    func start() // satrt 🤡🤣
}

final class ApplicationCoordinatorImpl {
    
    
    var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = []
    
    private let rootViewControllerPresenter: RootViewControllerPresenter
    private let applicationCoordinatorsFactory: ApplicationCoordinatorsFactory
    
    init(rootViewControllerPresenter: RootViewControllerPresenter, applicationCoordinatorsFactory: ApplicationCoordinatorsFactory) {
        self.rootViewControllerPresenter = rootViewControllerPresenter
        self.applicationCoordinatorsFactory = applicationCoordinatorsFactory
    }
    
    convenience init(window: UIWindow) {
        let rootViewControllerPresenter = RootViewControllerPresenterImpl(window: window)
        self.init(rootViewControllerPresenter: rootViewControllerPresenter, applicationCoordinatorsFactory: ApplicationCoordinatorsFactoryImpl())
    }
}

extension ApplicationCoordinatorImpl: ApplicationCoordinator {
    func start() {
        let coordinator = applicationCoordinatorsFactory.createTabCoordinator()
        coordinator.start()
        addChildCoordinator(coordinator)
        rootViewControllerPresenter.presentViewController(coordinator.rootViewController, withAnimations: true)
    }
}

