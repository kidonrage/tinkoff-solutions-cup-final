//
//  TSCSurface.swift
//  
//
//  Created by Vlad Eliseev on 22.04.2023.
//

import UIKit

public class TSCSurface: TSCView {
    
    public  var isCard: Bool = false {
        didSet {
            updateIsCard()
        }
    }
    
    private var shadowLayer: CALayer?

    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        setupAppearance()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupAppearance()
    }
    
    private func updateIsCard() {
        layer.backgroundColor = isCard
            ? UIColor.white.cgColor
            : UIColor.gray.cgColor
    }
    
    private func setupAppearance() {
        layer.cornerRadius = 24
        
        clipsToBounds = false
        
        updateIsCard()
    }
}
