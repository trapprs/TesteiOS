//
//  Dynamic.swift
//  TestSantanderiOS
//
//  Created by Renan Trapp on 04/05/19.
//  Copyright © 2019 Renan Trapp. All rights reserved.
//

import Foundation

class Dynamic<T> {
    typealias Listener = (T) -> Void
    
    private(set) var listener: Listener?
    private(set) var onSetEvents: Int = 0
    
    public var value: T {
        didSet {
            onSetEvents += 1
            callListener()
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(listener: Listener?) {
        self.listener = listener
    }
    
    func bindAndFire(listener: Listener?) {
        self.listener = listener
        callListener()
    }
    
    func isBinded() -> Bool {
        return listener != nil
    }
    
    private func callListener() {
        if Thread.isMainThread {
            listener?(value)
        } else {
            DispatchQueue.main.async {
                self.listener?(self.value)
            }
        }
    }
}
