//
//  ContactFormViewController.swift
//  TestSantanderiOS
//
//  Created by Renan Trapp on 04/05/19.
//  Copyright © 2019 Renan Trapp. All rights reserved.
//

import UIKit

final class ContactFormViewController: UIViewController {
    var presenter: ContactFormViewToPresenterProtocol?
    
    @IBOutlet private weak var navigationControllerView: NavigationControllerView! {
        didSet {
            navigationControllerView.configure(title: NSLocalizedString("Contact", comment: ""))
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.startFetching()
        
    }
    
    init() {
        super.init(nibName: "ContactFormViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension ContactFormViewController: ContactFormPresenterToViewProtocol {

}
