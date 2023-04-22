//
//  TSCButton.swift
//  
//
//  Created by Vlad Eliseev on 22.04.2023.
//

import UIKit

public final class TSCButton: UIButton {
    
    public var idleColor: UIColor? = TSCColor.buttonIdle
    public var highlightedColor: UIColor? = TSCColor.buttonHighlighted
    public var labelIdleColor: UIColor? = TSCColor.buttonLabelIdle
    public var labelHighlightedColor: UIColor? = TSCColor.buttonLabelHighlighted
    
    override public var isHighlighted: Bool {
        didSet {
            didUpdateHighlightedState()
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        commonInit()
    }
    
    private func commonInit() {
        didUpdateHighlightedState()
        layer.cornerRadius = TSCConstants.buttonCornerRadius
        
        setTitleColor(labelIdleColor, for: .normal)
        setTitleColor(labelHighlightedColor, for: .highlighted)
        
        contentEdgeInsets = .init(top: 10, left: 0, bottom: 10, right: 0)
    }
    
    private func didUpdateHighlightedState() {
        UIView.animate(withDuration: 0.2) {
            self.backgroundColor = self.isHighlighted
            ? self.highlightedColor
            : self.idleColor
        }
        
    }
}
