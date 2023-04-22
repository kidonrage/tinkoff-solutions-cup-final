//
//  File.swift
//  
//
//  Created by Vlad Eliseev on 22.04.2023.
//

import UIKit

public class TSCView: UIView {
    
    public var isElevated: Bool = false {
        didSet {
            updateIsElevated()
        }
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        commonInit()
    }
    
    private func commonInit() {
        updateIsElevated()
    }
    
    private func updateIsElevated() {
        if isElevated {
            layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.12).cgColor
            layer.shadowOpacity = 1
            layer.shadowRadius = 34
            layer.shadowOffset = CGSize(width: 0, height: 6)
        } else {
            layer.shadowPath = nil
        }
    }
}
