//
//  TabViewController.swift
//  LAND OF STARTUPS
//
//  Created by Mirrai Yessilbayeva on 12.04.2023.
//

import Foundation
import UIKit

final class TabViewController: UITabBarController {
    
    var presenter: TabPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
}

extension TabViewController: TabView {}

extension TabViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewcontroller: UIViewController) -> Bool {
        return true
    }
}

private extension TabViewController {
    func setupUI() {
        delegate = self
    }
}
