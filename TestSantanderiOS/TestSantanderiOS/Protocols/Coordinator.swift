//
//  Coordinator.swift
//  TestSantanderiOS
//
//  Created by Renan Trapp on 04/05/19.
//  Copyright © 2019 Renan Trapp. All rights reserved.
//

import Foundation

protocol Coordinator: AnyObject {
    var coordinators: [Coordinator] { get set }
    
    @discardableResult func start() -> Self
    @discardableResult func add(coordinator: Coordinator) -> Coordinator
    @discardableResult func remove(coordinator: Coordinator) -> Coordinator
}

extension Coordinator {
    @discardableResult
    func add(coordinator: Coordinator) -> Coordinator {
        self.coordinators.append(coordinator)
        
        return coordinator
    }
    @discardableResult
    func remove(coordinator: Coordinator) -> Coordinator {
        self.coordinators.removeAll { $0 === coordinator }
        
        return coordinator
    }
}
