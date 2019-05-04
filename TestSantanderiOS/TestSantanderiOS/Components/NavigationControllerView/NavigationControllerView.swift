//
//  NavigationControllerView.swift
//  TestSantanderiOS
//
//  Created by Renan Trapp on 04/05/19.
//  Copyright © 2019 Renan Trapp. All rights reserved.
//

import UIKit

protocol NavigationControllerProtocol: AnyObject {
    func pressRightButton()
}

@IBDesignable final class NavigationControllerView: UIView {
    @IBOutlet weak var navigationTitleLabel: UILabel! {
        didSet {
            navigationTitleLabel.font = DINFont.medium.of(size: 16)
        }
    }
    @IBOutlet weak var rightButton: UIButton! {
        didSet {
            self.rightButton.isHidden = true
        }
    }
    private weak var delegate: NavigationControllerProtocol?
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        customInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        customInit()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        customInit()
    }
    
    // MARK: - Functions
    private func customInit() {
        guard let view = Bundle(for: NavigationControllerView.self).loadNibNamed("NavigationControllerView", owner: self, options: nil)?.first as? UIView else {
            return
        }
        
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
    }
    
    func configure(with delegate: NavigationControllerProtocol? = nil,
                   title: String,
                   buttonRightImage: UIImage? = nil) {
        self.delegate = delegate
        self.navigationTitleLabel.text = title
        if let buttonRightImage = buttonRightImage {
            self.rightButton.isHidden = false
            self.rightButton.setImage(buttonRightImage, for: .normal) 
        }
    }
    
    // MARK: - Action
    @IBAction func rightButtonTapped(_ sender: UIButton) {
        delegate?.pressRightButton()
    }
}
