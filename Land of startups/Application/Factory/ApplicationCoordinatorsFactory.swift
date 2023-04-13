//
//  ApplicationCoordinatorsFactory.swift
//  LAND OF STARTUPS
//
//  Created by Mirrai Yessilbayeva on 13.04.2023.
//

import Foundation

protocol ApplicationCoordinatorsFactory {
    func createTabCoordinator() -> TabCoordinator
}

struct ApplicationCoordinatorsFactoryImpl {}


extension ApplicationCoordinatorsFactoryImpl: ApplicationCoordinatorsFactory {
    
    func createTabCoordinator() -> TabCoordinator {
        TabCoordinatorImpl()
    }
}
