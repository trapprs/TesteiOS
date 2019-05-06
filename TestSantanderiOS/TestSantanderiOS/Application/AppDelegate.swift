//
//  AppDelegate.swift
//  TestSantanderiOS
//
//  Created by Renan Trapp on 03/05/19.
//  Copyright © 2019 Renan Trapp. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        if let window = self.window {
            let applicationCoordinator = ApplicationCoordinator(window: window)
            
            applicationCoordinator.start()
        }
        return true
    }
}

