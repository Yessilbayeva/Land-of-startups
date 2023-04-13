////
////  MainCoordinator.swift
////  LAND OF STARTUPS
////
////  Created by Mirrai Yessilbayeva on 03.04.2023.
////
//
//import UIKit
//
//final class MainCoordinator: Coordinator { // make class final
//    
//    var childCoordinators = [Coordinator]()
//    var navigationController: UINavigationController
//    
//    init(navigationController: UINavigationController) {
//        self.navigationController = navigationController
//    }
//    
//    func start() {
//        let tabBarController = TabCoordinator.instantiate()
//        tabBarController.start()
//        /// create tabBar controller then push in pushViewController
//        /// let tabController = TabBarCoordinator.instantiate()
//        /// tabBarController.start()
//        /// navigationController.pushViewController(tabController, animated: true)
//        
//        navigationController.pushViewController(TabCoordinator.instantiate().start(), animated: true)
//      //navigationController.pushViewController(tabBarController, animated: true)
//        
//        // TODO: - Используйте для теста
//        /// let redVC = UIViewController()
//        /// redVC.view.backgroundColor = .red
//        /// navigationController.pushViewController(redVC, animated: true)
//    }
//}
//
