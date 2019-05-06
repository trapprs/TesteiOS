//
//  ContactFormRouter.swift
//  TestSantanderiOS
//
//  Created by Renan Trapp on 04/05/19.
//  Copyright © 2019 Renan Trapp. All rights reserved.
//

import UIKit

class ContactFormRouter: ContactFormPresenterToRouterProtocol {
    static func createContactFormModule() -> ContactFormViewController {
        let view  = ContactFormViewController()
        let presenter = ContactFormPresenter()
        let interactor = ContactFormInteractor()
       // let router = ContactFormRouter()
        
        view.presenter = presenter
        presenter.view = view
      //  presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter

        return view
    }
}

extension ContactFormRouter {
    
}
