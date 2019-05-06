//
//  ContactProtocol.swift
//  TestSantanderiOS
//
//  Created by Renan Trapp on 04/05/19.
//  Copyright © 2019 Renan Trapp. All rights reserved.
//

import Foundation


protocol ContactFormViewToPresenterProtocol: AnyObject {
    var view: ContactFormPresenterToViewProtocol? {get set}
    var interactor: ContactFormPresenterToInteractorProtocol? {get set}
    
    func startFetching()
}

protocol ContactFormPresenterToViewProtocol {
    var presenter: ContactFormViewToPresenterProtocol? { get set }
}

protocol ContactFormPresenterToInteractorProtocol {
    
}

protocol ContactFormInteractorToPresenterProtocol {
    
}

