//
//  TabModuleFactory.swift
//  LAND OF STARTUPS
//
//  Created by Mirrai Yessilbayeva on 13.04.2023.
//

import Foundation

typealias TabModuleFactory = AnyModuleFactory<TabCoordinator, TabPresenter>

struct TabModuleFactoryImpl {}

extension TabModuleFactoryImpl: ModuleFactory {
    func createModule(withCoordinator coordinator: TabCoordinator) -> Module<TabPresenter> {
        let viewController = TabViewController.instantiate()
        viewController.presenter = TabPresenterImpl()
        viewController.presenter.coordinator = coordinator
        viewController.presenter.view = viewController
        return Module(view: viewController, presenter: viewController.presenter)
    }
}
