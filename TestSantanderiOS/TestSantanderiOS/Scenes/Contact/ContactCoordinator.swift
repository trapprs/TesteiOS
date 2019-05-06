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
    let view: UINavigationController
    private weak var navigationDelegate: ContactCoordinatorNavigationDelegate?
    
    @discardableResult
    func start() -> Self {
        openContact()
        
        return self
    }
    
    init(view: UINavigationController,
         navigationDelegate: ContactCoordinatorNavigationDelegate? = nil) {
        self.view = view
        self.navigationDelegate = navigationDelegate
    }
    
    private func openContact() {
        let view  = ContactFormViewController()
        let presenter = ContactFormPresenter()
        let interactor = ContactFormInteractor()

        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        interactor.presenter = presenter

        self.view.pushViewController(view, animated: true)
    }
}
