//
//  AnyModuleFactory.swift
//  LAND OF STARTUPS
//
//  Created by Mirrai Yessilbayeva on 13.04.2023.
//

import Foundation

class AnyModuleFactory<C, M>: ModuleFactory {
    
    private let box: AbstractModuleFactory<C, M>
    
    init<F: ModuleFactory>(_ moduleFactory: F) where F.CoordinatorFlow == C, F.ModuleType == M {
        self.box = AnyModuleFactoryBox(moduleFactory)
    }
    
    func createModule(withCoordinator coordinator: C) -> Module<M> {
        return box.createModule(withCoordinator: coordinator)
    }
}

private class AbstractModuleFactory<C, M>: ModuleFactory {
    
    func createModule(withCoordinator coordinator: C) -> Module<M> {
        fatalError("abstract, must be overriden")
    }
}

private class AnyModuleFactoryBox<M: ModuleFactory>: AbstractModuleFactory<M.CoordinatorFlow, M.ModuleType> {
    
    private var concrete: M
    
    init(_ concrete: M) {
        self.concrete = concrete
    }
    
    override func createModule(withCoordinator coordinator: AnyModuleFactoryBox<M>.CoordinatorFlow) -> Module<AnyModuleFactoryBox<M>.ModuleType> {
        return concrete.createModule(withCoordinator: coordinator)
    }
}
