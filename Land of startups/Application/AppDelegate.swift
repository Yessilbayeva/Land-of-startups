//
//  AppDelegate.swift
//  LAND OF STARTUPS
//
//  Created by Mirrai Yessilbayeva on 03.04.2023.
//

import UIKit

@main
final class AppDelegate: UIResponder {
    
    var window: UIWindow!
    
    private lazy var appCoordinator: ApplicationCoordinator = {
        window = UIWindow()
        let appCoordinator = ApplicationCoordinatorImpl(window: window)
        return appCoordinator
    }()
}
    //var coordinator: MainCoordinator?
    
extension AppDelegate: UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?) -> Bool {
        configureAppearance()
        return true
    }
}

private extension AppDelegate {
    
    func configureAppearance() {
        AppearanceConfigurator.configureAppearance()
    }
}
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        let navigationController = UINavigationController()
//        coordinator = MainCoordinator(navigationController: navigationController)
//        coordinator?.start()
//
//        window = UIWindow(frame: UIScreen.main.bounds)
//        window?.rootViewController = navigationController
//        window?.makeKeyAndVisible()
//
//        return true
//    }
//}
