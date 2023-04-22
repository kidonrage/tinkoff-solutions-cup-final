//
//  ViewController.swift
//  TSCKitDemo
//
//  Created by Vlad Eliseev on 22.04.2023.
//

import UIKit
import TSCKit

class ViewController: UIViewController {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    private lazy var contentView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        stackView.spacing = 16
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray6
        
        setupView()
    }
    
    private func setupView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        
        setupContent()
    }
    
    private func setupContent() {
        contentView.addArrangedSubview(createCard(headerText: "Header", description: nil, leftHeaderAccessory: nil, rightHeaderAccessory: nil, footer: nil))
        
        contentView.addArrangedSubview(createCard(headerText: "Header", description: "Description", leftHeaderAccessory: nil, rightHeaderAccessory: nil, footer: nil))
        
        contentView.addArrangedSubview(createCard(headerText: "Header", description: "Description", leftHeaderAccessory: nil, rightHeaderAccessory: createAvatarView(), footer: nil))
        
        contentView.addArrangedSubview(createCard(headerText: "Header", description: "Description", leftHeaderAccessory: nil, rightHeaderAccessory: createCloseButton(), footer: nil))
        
        contentView.addArrangedSubview(createCard(headerText: "Header", description: "Description", leftHeaderAccessory: createAvatarView(), rightHeaderAccessory: nil, footer: nil))
        
        
        contentView.addArrangedSubview(createCard(headerText: "Header", description: "Description", leftHeaderAccessory: createAvatarView(), rightHeaderAccessory: createCloseButton(), footer: nil))
        
        let button = TSCButton()
        button.setTitle("Button", for: .normal)
        contentView.addArrangedSubview(
            createCard(
                headerText: "Header",
                description: "Description",
                leftHeaderAccessory: nil,
                rightHeaderAccessory: nil,
                footer: button
            )
        )
        
        let list = TSCList()
        list.configureUI(dataSource: TSCListDataSource(items: [
            .init(header: "Header", subheader: "Description")
        ]))
        contentView.addArrangedSubview(
            createCard(
                headerText: "Header",
                description: "Description",
                leftHeaderAccessory: nil,
                rightHeaderAccessory: nil,
                footer: TSCList()
            )
        )
    }
    
    private func createCard(
        headerText: String,
        description: String?,
        leftHeaderAccessory: UIView?,
        rightHeaderAccessory: UIView?,
        footer: UIView?
    ) -> TSCCard {
        let header = TSCCardHeaderView()
        header.headerText = headerText
        header.descriptionText = description
        header.leadingAccessoryView = leftHeaderAccessory
        header.trailingAccessoryView = rightHeaderAccessory
        let card = TSCCard()
        card.headerView = header
        card.footerView = footer
        return card
    }
    
    private func createAvatarView() -> UIImageView {
        let imageView = UIImageView(image: UIImage(named: "avatarPlaceholder"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
    
    private func createCloseButton() -> UIImageView {
        let imageView = UIImageView(image: UIImage(named: "closeButton"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
}

