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
        loadContact()
        
        return self
    }
    
    private func loadContact() {        
        let contactCoordinator = ContactCoordinator(view: rootViewController,
                                                    navigationDelegate: self)
        window.rootViewController = contactCoordinator.view
        window.makeKeyAndVisible()
        
        contactCoordinator.start()
        add(coordinator: contactCoordinator)
    }
}

// MARK: - ContactCoordinatorNavigationDelegate
extension ApplicationCoordinator: ContactCoordinatorNavigationDelegate {
    
}
