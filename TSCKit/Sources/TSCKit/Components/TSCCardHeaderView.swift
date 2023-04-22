//
//  File.swift
//  
//
//  Created by Vlad Eliseev on 22.04.2023.
//

import UIKit

public final class TSCCardHeaderView: TSCView {
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return label
    }()
    private lazy var textStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            headerLabel,
            descriptionLabel
        ])
        stackView.setContentHuggingPriority(.defaultLow, for: .horizontal)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 4
        return stackView
    }()
    private lazy var trailingAccessoryViewContainer: TSCView = {
        let view = TSCView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return view
    }()
    private lazy var leadingAccessoryViewContainer: TSCView = {
        let view = TSCView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return view
    }()
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            leadingAccessoryViewContainer,
            textStackView,
            trailingAccessoryViewContainer
        ])
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fill
        return stackView
    }()
    
    public var headerText: String = "" {
        didSet {
            updateTexts()
        }
    }
    public var descriptionText: String? {
        didSet {
            updateTexts()
        }
    }
    
    public var trailingAccessoryView: UIView? {
        didSet {
            didChangeTrailingAccessoryView(
                oldValue: oldValue)
        }
    }
    public var leadingAccessoryView: UIView? {
        didSet {
            didChangeLeadingAccessoryView(
                oldValue: oldValue)
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
    
    private func updateTexts() {
        headerLabel.text = headerText
        descriptionLabel.isHidden = descriptionText == nil
        descriptionLabel.text = descriptionText
    }
    
    private func didChangeTrailingAccessoryView(oldValue: UIView?) {
        defer {
            trailingAccessoryViewContainer.isHidden = trailingAccessoryView == nil
        }
        
        if let oldValue {
            oldValue.removeFromSuperview()
            oldValue.constraints.forEach({ removeConstraint($0) })
        }
        
        if let trailingAccessoryView {
            trailingAccessoryViewContainer.addSubview(trailingAccessoryView)
            
            trailingAccessoryView.setContentHuggingPriority(.defaultLow, for: .horizontal)
            
            NSLayoutConstraint.activate([
                trailingAccessoryView.topAnchor.constraint(equalTo: trailingAccessoryViewContainer.topAnchor),
                trailingAccessoryView.trailingAnchor.constraint(equalTo: trailingAccessoryViewContainer.trailingAnchor),
                trailingAccessoryView.bottomAnchor.constraint(lessThanOrEqualTo: trailingAccessoryViewContainer.bottomAnchor),
                trailingAccessoryView.leadingAnchor.constraint(equalTo: trailingAccessoryViewContainer.leadingAnchor),
                
                trailingAccessoryView.widthAnchor.constraint(equalToConstant: trailingAccessoryView.intrinsicContentSize.width)
            ])
        }
    }
    
    private func didChangeLeadingAccessoryView(oldValue: UIView?) {
        defer {
            leadingAccessoryViewContainer.isHidden = leadingAccessoryView == nil
        }
        
        if let oldValue {
            oldValue.removeFromSuperview()
            oldValue.constraints.forEach({ removeConstraint($0) })
        }
        
        if let leadingAccessoryView {
            leadingAccessoryViewContainer.addSubview(leadingAccessoryView)
            
            
            leadingAccessoryView.setContentHuggingPriority(.defaultLow, for: .horizontal)

            NSLayoutConstraint.activate([
                leadingAccessoryView.topAnchor.constraint(equalTo: leadingAccessoryViewContainer.topAnchor),
                leadingAccessoryView.leadingAnchor.constraint(equalTo: leadingAccessoryViewContainer.leadingAnchor),
                leadingAccessoryView.bottomAnchor.constraint(lessThanOrEqualTo: leadingAccessoryViewContainer.bottomAnchor),
                leadingAccessoryView.trailingAnchor.constraint(equalTo: leadingAccessoryViewContainer.trailingAnchor),
                
                leadingAccessoryView.widthAnchor.constraint(equalToConstant: leadingAccessoryView.intrinsicContentSize.width)
            ])
        }
    }
    
    private func commonInit() {
        updateTexts()
        
        addSubview(contentStackView)
        
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: topAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            leadingAccessoryViewContainer.widthAnchor.constraint(lessThanOrEqualToConstant: 56),
            trailingAccessoryViewContainer.widthAnchor.constraint(lessThanOrEqualToConstant: 56)
        ])
        
        didChangeTrailingAccessoryView(oldValue: nil)
        didChangeLeadingAccessoryView(oldValue: nil)
    }
}
