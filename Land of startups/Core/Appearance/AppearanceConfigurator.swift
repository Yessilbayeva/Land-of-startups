//
//  AppearanceConfigurator.swift
//  LAND OF STARTUPS
//
//  Created by Mirrai Yessilbayeva on 12.04.2023.
//

import UIKit

enum AppearanceConfigurator {
    
    private static let tabBarAppearance = UITabBar.appearance()

    static func configureAppearance() {
        configureTabBarController()
    }
}

private extension AppearanceConfigurator {
    
    static func configureTabBarController() {
        tabBarAppearance.backgroundColor = UIColor.white
//        tabBarAppearance.backgroundColor = ColorFactory.color(for: .tabBarBackground)
//        tabBarAppearance.tintColor = ColorFactory.color(for: .fill0)
//        tabBarAppearance.unselectedItemTintColor = ColorFactory.color(for: .fill1)
    }
    
}
