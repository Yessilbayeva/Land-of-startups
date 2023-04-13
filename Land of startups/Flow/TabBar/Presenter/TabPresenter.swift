//
//  TabPresenter.swift
//  LAND OF STARTUPS
//
//  Created by Mirrai Yessilbayeva on 13.04.2023.
//

import Foundation

protocol TabPresenter {
    var view: TabView! { get set }
    var coordinator: TabCoordinator! { get set }
    
}

final class TabPresenterImpl {
    
    weak var view: TabView!
    weak var coordinator: TabCoordinator!
    
}

extension TabPresenterImpl: TabPresenter {
    
}
