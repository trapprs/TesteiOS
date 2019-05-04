//
//  ContactCoordinator.swift
//  TestSantanderiOS
//
//  Created by Renan Trapp on 04/05/19.
//  Copyright © 2019 Renan Trapp. All rights reserved.
//

import UIKit

protocol ContactCoordinatorNavigationDelegate: AnyObject {}

final class ContactCoordinator: Coordinator {
    var coordinators: [Coordinator] = []
    let presenter: UINavigationController
    private weak var navigationDelegate: ContactCoordinatorNavigationDelegate?
    
    @discardableResult
    func start() -> Self {
        openContact()
        
        return self
    }
    
    init(presenter: UINavigationController,
         navigationDelegate: ContactCoordinatorNavigationDelegate? = nil) {
        self.presenter = presenter
        self.navigationDelegate = navigationDelegate
    }
    
    private func openContact() {
        let contactFormViewController = ContactFormViewController()
        presenter.pushViewController(contactFormViewController, animated: true)
        
        add(coordinator: self)
    }
}
