//
//  ContactFormViewController.swift
//  TestSantanderiOS
//
//  Created by Renan Trapp on 04/05/19.
//  Copyright © 2019 Renan Trapp. All rights reserved.
//

import UIKit

final class ContactFormViewController: UIViewController {
    @IBOutlet weak var navigationControllerView: NavigationControllerView! {
        didSet {
            navigationControllerView.configure(title: NSLocalizedString("Contact", comment: ""))
        }
    }
}

