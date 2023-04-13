//
//  ModuleFactory.swift
//  LAND OF STARTUPS
//
//  Created by Mirrai Yessilbayeva on 13.04.2023.
//

import Foundation

protocol ModuleFactory {
    associatedtype CoordinatorFlow
    associatedtype ModuleType
    
    func createModule(withCoordinator coordinator: CoordinatorFlow) -> Module<ModuleType>
}
