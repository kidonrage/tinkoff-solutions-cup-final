//
//  File.swift
//  
//
//  Created by Vlad Eliseev on 22.04.2023.
//

import UIKit

public struct TSCListItemConfig {
    
    let header: String
    let subheader: String
    
    public init(header: String, subheader: String) {
        self.header = header
        self.subheader = subheader
    }
}

public struct TSCListDataSource {
    
    public let items: [TSCListItemConfig]
    
    public init(items: [TSCListItemConfig]) {
        self.items = items
    }
}

public final class TSCList: UIView {
    
    private var contentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [])
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var dataSource: TSCListDataSource?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        commonInit()
    }
    
    public func configureUI(dataSource: TSCListDataSource) {
        contentStackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
            contentStackView.removeArrangedSubview($0)
        }
        for item in dataSource.items {
            let headerView = TSCCardHeaderView()
            headerView.headerText = item.header
            headerView.descriptionText = item.subheader
            contentStackView.addArrangedSubview(headerView)
        }
    }
    
    private func commonInit() {
        addSubview(contentStackView)
        
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: topAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
        ])
    }
}
