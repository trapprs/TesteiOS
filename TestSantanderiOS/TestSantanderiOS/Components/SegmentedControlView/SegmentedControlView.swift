//
//  SegmentedControlView.swift
//  TestSantanderiOS
//
//  Created by Renan Trapp on 05/05/19.
//  Copyright © 2019 Renan Trapp. All rights reserved.
//

import UIKit

enum SegmentedValues: Int {
    case found = 0
    case contact = 1
}

enum SegmentedNames: String {
    case found = "Investimento"
    case contact = "Contado"
}

final class SegmentedControlView: UIView {
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    let view = UIView()
    
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
        guard let view = Bundle(for: NavigationControllerView.self).loadNibNamed("SegmentedControlView", owner: self, options: nil)?.first as? UIView else {
            return
        }
        
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
    }
    
    func configure(segmentedAt: SegmentedValues) {
        customInit()
        segmentedControl.selectedSegmentIndex = segmentedAt.rawValue
        
        setSegmentedControl()
    }
    
    private func setSegmentedControl() {
        segmentedControl.backgroundColor = CustonColor.segmentedColor
        segmentedControl.tintColor = CustonColor.segmentedColorSelected
        segmentedControl.setTitle(SegmentedNames.contact.rawValue, forSegmentAt: SegmentedValues.contact.rawValue)
        segmentedControl.setTitle(SegmentedNames.found.rawValue, forSegmentAt: SegmentedValues.found.rawValue)
        
        segmentedControl.setTitleTextAttributes([
            NSAttributedString.Key.font : DINFont.medium.of(size: 16),
            NSAttributedString.Key.foregroundColor: UIColor.white
            ], for: .normal)
        
        segmentedControl.setTitleTextAttributes([
            NSAttributedString.Key.font : DINFont.medium.of(size: 16),
            NSAttributedString.Key.foregroundColor: UIColor.white
            ], for: .selected)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = CustonColor.segmentedColorSelected
        
        segmentedControl.addSubview(view)

        view.bottomAnchor.constraint(equalTo: segmentedControl.topAnchor).isActive = true
        view.heightAnchor.constraint(equalToConstant: 2).isActive = true
        view.leftAnchor.constraint(equalTo: segmentedControl.leftAnchor).isActive = true
        view.widthAnchor.constraint(equalTo: segmentedControl.widthAnchor,
                                         multiplier: 1 / CGFloat(segmentedControl.numberOfSegments)).isActive = true
        let xPosition =  (self.segmentedControl.frame.width / CGFloat(self.segmentedControl.numberOfSegments))
            * CGFloat(self.segmentedControl.selectedSegmentIndex)
        view.frame = CGRect(x: xPosition,
                            y: view.frame.size.height,
                            width: segmentedControl.frame.width,
                            height: 2)
     
    }
    
    private func changeSegmented(segmentedAt: SegmentedValues) {
        self.view.frame.origin.x = (self.segmentedControl.frame.width /
            CGFloat(self.segmentedControl.numberOfSegments))
            * CGFloat(segmentedAt.rawValue)
    }
    
    @IBAction func segmentedControlTapped(_ sender: UISegmentedControl) {
        
        changeSegmented(segmentedAt: SegmentedValues.init(rawValue: segmentedControl.selectedSegmentIndex) ?? .contact)
    }
}
