//
//  TabCoordinator.swift
//  LAND OF STARTUPS
//
//  Created by Mirrai Yessilbayeva on 03.04.2023.
//

import UIKit

protocol TabCoordinator: Coordinator {
    var rootViewController: UITabBarController { get }
    
    func start()
}

final class TabCoordinatorImpl {
    
    var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = []
    var rootViewController: UITabBarController {
        return tabBarController
    }
    
    private var tabBarController: UITabBarController!
    
    private let moduleFactory: TabModuleFactory
    private let coordinatorsFactory: TabCoordinatorsFactory
    
    
    init(moduleFactory: TabModuleFactory,
         coordinatorsFactory: TabCoordinatorsFactory) {
        self.moduleFactory = moduleFactory
        self.coordinatorsFactory = coordinatorsFactory
    }
    
    convenience init() {
        self.init(moduleFactory: AnyModuleFactory(TabModuleFactoryImpl()),
                  coordinatorsFactory: TabCoordinatorsFactoryImpl() as! TabCoordinatorsFactory)
    }
}

extension TabCoordinatorImpl: TabCoordinator {
    func start() {
        let module = moduleFactory.createModule(withCoordinator: self)
        tabBarController = module.view as? UITabBarController
        setupRootModules()
    }
}

private extension TabCoordinatorImpl {
    
    func setupRootModules() {
        let homeController = createHomeModule()
        let vacanciesController = createVacanciesModule()
        let servicesController = createServicesModule()
        let profileController = createProfileModule()
    }
    
//    func createHomeModule() -> UIViewController {
//        let coordinator = coordinatorsFactory.createHomeCoordinator()
//        coordinator.start()
//        addChildCoordinator(coordinator)
//        return coordinator.rootViewController
//    }
    
    func createHomeModule() -> UIViewController {
        let viewController = UIViewController()
        viewController.tabBarItem.title = TabLocalization.home.localized
        viewController.tabBarItem.image = ImageFactory.image(for: .home)
        viewController.tabBarItem.selectedImage = ImageFactory.image(for: .home)
        viewController.view.backgroundColor = UIColor.gray
        return viewController
    }
    
    func createVacanciesModule() -> UIViewController {
        let viewController = UIViewController()
        viewController.tabBarItem.title = TabLocalization.vacancies.localized
        viewController.tabBarItem.image = ImageFactory.image(for: .vacancies)
        viewController.tabBarItem.selectedImage = ImageFactory.image(for: .vacancies)
        viewController.view.backgroundColor = UIColor.white
        return viewController
    }
    
    func createServicesModule() -> UIViewController {
        let viewController = UIViewController()
        viewController.tabBarItem.title = TabLocalization.services.localized
        viewController.tabBarItem.image = ImageFactory.image(for: .services)
        viewController.tabBarItem.selectedImage = ImageFactory.image(for: .services)
        viewController.view.backgroundColor = UIColor.red
        return viewController
    }
    
    func createProfileModule() -> UIViewController {
        let viewController = UIViewController()
        viewController.tabBarItem.title = TabLocalization.profile.localized
        viewController.tabBarItem.image = ImageFactory.image(for: .profile)
        viewController.tabBarItem.selectedImage = ImageFactory.image(for: .profile)
        viewController.view.backgroundColor = UIColor.red
        return viewController
    }
}
