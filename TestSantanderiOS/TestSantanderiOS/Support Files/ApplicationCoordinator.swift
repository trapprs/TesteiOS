//
//  ApplicationCoordinator.swift
//  TestSantanderiOS
//
//  Created by Renan Trapp on 04/05/19.
//  Copyright © 2019 Renan Trapp. All rights reserved.
//

import UIKit

final class ApplicationCoordinator: Coordinator {
    var coordinators: [Coordinator] = []
    private lazy var rootViewController: UINavigationController = {
        let navigationController = UINavigationController()
        navigationController.isNavigationBarHidden = true
        
        return navigationController
    }()
    private let window: UIWindow
    
    // MARK: - Initialization
    init(window: UIWindow) {
        self.window = window
    }
    
    @discardableResult
    func start() -> Self {
        let contactCoordinator = ContactCoordinator(presenter: rootViewController,
                                                  navigationDelegate: self)
        window.makeKeyAndVisible()
        window.rootViewController = contactCoordinator.presenter
        contactCoordinator.start()

        return self
    }
}

// MARK: - ContactCoordinatorNavigationDelegate
extension ApplicationCoordinator: ContactCoordinatorNavigationDelegate {
    
}
