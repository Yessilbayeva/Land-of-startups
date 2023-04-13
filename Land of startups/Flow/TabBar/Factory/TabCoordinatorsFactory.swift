//
//  TabCoordinatorsFactory.swift
//  LAND OF STARTUPS
//
//  Created by Mirrai Yessilbayeva on 13.04.2023.
//

import Foundation

protocol TabCoordinatorsFactory {
    func createHomeCoordinator() -> HomeCoordinator
}

struct TabCoordinatorsFactoryImpl {}

//extension TabCoordinatorsFactoryImpl: TabCoordinatorsFactory {
//    func createHomeCoordinator() -> HomeCoordinator {
//        HomeCoordinatorImpl()
//    }
//}
