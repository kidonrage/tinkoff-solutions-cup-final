//
//  File.swift
//  
//
//  Created by Vlad Eliseev on 22.04.2023.
//

import UIKit

public final class TSCCard: TSCSurface {
    
    public var headerView: TSCCardHeaderView? {
        didSet {
            didHeaderViewSet(oldValue: oldValue)
        }
    }
    public var footerView: UIView? {
        didSet {
            didFooterViewSet(oldValue: oldValue)
        }
    }
    
    private lazy var cardStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [])
        stackView.spacing = 12
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        return stackView
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        self.isCard = true
        
        addSubview(cardStackView)
        
        NSLayoutConstraint.activate([
            cardStackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            cardStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            cardStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            cardStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
        ])
        
        didFooterViewSet(oldValue: nil)
    }
    
    private func didHeaderViewSet(oldValue: TSCCardHeaderView?) {
        if let oldValue {
            oldValue.removeFromSuperview()
            cardStackView.removeArrangedSubview(oldValue)
        }
        
        if let headerView {
            cardStackView.insertArrangedSubview(headerView, at: 0)
        }
    }
    
    private func didFooterViewSet(oldValue: UIView?) {
        if let oldValue {
            oldValue.removeFromSuperview()
            cardStackView.removeArrangedSubview(oldValue)
        }
        
        if let footerView {
            cardStackView.insertArrangedSubview(footerView, at: 1)
        }
    }
}
