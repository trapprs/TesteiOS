
//
//  ContactFormPresenter.swift
//  TestSantanderiOS
//
//  Created by Renan Trapp on 04/05/19.
//  Copyright © 2019 Renan Trapp. All rights reserved.
//

import Foundation

final class ContactFormPresenter: ContactFormViewToPresenterProtocol {
    var interactor: ContactFormPresenterToInteractorProtocol?
    var view: ContactFormPresenterToViewProtocol?
    
    func startFetching() {
        
    }
}
extension ContactFormPresenter: ContactFormInteractorToPresenterProtocol {
    
}


