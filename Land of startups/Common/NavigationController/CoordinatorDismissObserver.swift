//
//  CoordinatorDismissObserver.swift
//  LAND OF STARTUPS
//
//  Created by Mirrai Yessilbayeva on 13.04.2023.
//

import UIKit


protocol CoordinatorDismissObserver {
    func configurePresentationControllerDelegate(for navigationController: UINavigationController)
    func observeDismiss(of viewController: UIViewController, with coordinator: Coordinator)
    func observeDismiss(of viewController: UIViewController, with coordinators: [Coordinator])
    func removeObserver(of viewController: UIViewController)
}


protocol NavigationControllerFlowDismissObserverDelegate: AnyObject {
    func navigationControllerFlowDismissObserver(_ observer: NavigationControllerFlowDismissObserver,
                                                 didObserveDismissOfCoordinators coordinators: [Coordinator])
}

// MARK: - NavigationControllerFlowDismissObserver

protocol NavigationControllerFlowDismissObserver: AnyObject, CoordinatorDismissObserver {
    
    var delegate: NavigationControllerFlowDismissObserverDelegate? { get set }
    
    func setup(for navigationController: UINavigationController)
}


final class NavigationControllerFlowDismissObserverImpl {
    
    // MARK: - Public Properties
    
    weak var delegate: NavigationControllerFlowDismissObserverDelegate?
    
    // MARK: - Dependencies
    
    private let navigationControllerDelegate: NavigationControllerDelegate
    private let presentationDelegate: AdaptivePresentationControllerDelegate
    
    // MARK: - Private Properties
    
    private var queue: [UIViewController: [Coordinator]] = [:]
    
    // MARK: - Init
    
    init(navigationControllerDelegate: NavigationControllerDelegate, presentationDelegate: AdaptivePresentationControllerDelegate) {
        self.navigationControllerDelegate = navigationControllerDelegate
        self.presentationDelegate = presentationDelegate
    }
    
    convenience init() {
        self.init(navigationControllerDelegate: NavigationControllerDelegateImpl(),
                  presentationDelegate: AdaptivePresentationControllerDelegateImpl())
    }
}

// MARK: - NavigationControllerFlowDismissObserver

extension NavigationControllerFlowDismissObserverImpl: NavigationControllerFlowDismissObserver {
    
    func setup(for navigationController: UINavigationController) {
        navigationController.delegate = navigationControllerDelegate
        navigationControllerDelegate.controllerDismissed = { [weak self] controller in
            self?.onControllerDismissed(controller)
        }
        presentationDelegate.controllerDismissed = { [weak self] controller in
            self?.onControllerDismissed(controller)
        }
    }
}

// MARK: - CoordinatorDismissObserver

extension NavigationControllerFlowDismissObserverImpl: CoordinatorDismissObserver {
    
    func observeDismiss(of viewController: UIViewController, with coordinator: Coordinator) {
        observeDismiss(of: viewController, with: [coordinator])
    }
    
    func observeDismiss(of viewController: UIViewController, with coordinators: [Coordinator]) {
        queue[viewController] = coordinators
    }
    
    func configurePresentationControllerDelegate(for navigationController: UINavigationController) {
        navigationController.presentationController?.delegate = presentationDelegate
    }
    
    func removeObserver(of viewController: UIViewController) {
        queue.removeValue(forKey: viewController)
    }
}

// MARK: - Private

private extension NavigationControllerFlowDismissObserverImpl {
    
    func onControllerDismissed(_ controller: UIViewController) {
        guard let coordinators = queue[controller] else { return }
        delegate?.navigationControllerFlowDismissObserver(self, didObserveDismissOfCoordinators: coordinators)
        queue.removeValue(forKey: controller)
    }
}
