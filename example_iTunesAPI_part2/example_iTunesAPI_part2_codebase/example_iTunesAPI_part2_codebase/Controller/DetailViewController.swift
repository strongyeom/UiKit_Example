//
//  DetailViewController.swift
//  example_iTunesAPI_part2_codebase
//
//  Created by 염성필 on 2023/04/14.
//

import UIKit


class DetailViewController: UIViewController {
    
    
    // MARK: - Properties
    
    
    var detailITunes: ITunes?
    
    
    // scrollView
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    // UiView
    let contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    // IconImage
    var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "screenShot1")
        return imageView
    }()
    
    // APP Name
   lazy var appName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.textColor = .black
        label.text = detailITunes?.trackName
        return label
    }()
    
    // Description
   lazy var appDescription: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 1
        label.textColor = .systemGray
        label.text = detailITunes?.description
        return label
    }()
    
    // downLoadBtn
    var downLoadButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("받기", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.backgroundColor = .link
        return button
    }()
    
    // shardBtn
    var shardButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        return button
    }()
    
    // vStack
    lazy var textStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [appName, appDescription])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 1
        return stack
    }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupScroll()
    }
    
    func setupScroll() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        view.addSubview(iconImageView)
        view.addSubview(textStack)
        view.addSubview(shardButton)
        view.addSubview(downLoadButton)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        textStack.translatesAutoresizingMaskIntoConstraints = false
        shardButton.translatesAutoresizingMaskIntoConstraints = false
        downLoadButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 1500),
            
            
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            
            iconImageView.widthAnchor.constraint(equalToConstant: 100),
            iconImageView.heightAnchor.constraint(equalToConstant: 100),
            downLoadButton.widthAnchor.constraint(equalToConstant: 70),
            
            
            iconImageView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 10),
            iconImageView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            
            textStack.topAnchor.constraint(equalTo: iconImageView.topAnchor),
            textStack.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 10),
            textStack.trailingAnchor.constraint(equalTo: shardButton.leadingAnchor, constant: -10),
            
            downLoadButton.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 10),
            downLoadButton.topAnchor.constraint(equalTo: shardButton.topAnchor),
            downLoadButton.bottomAnchor.constraint(equalTo: iconImageView.bottomAnchor),
            //downLoadButton.trailingAnchor.constraint(equalTo: shardButton.leadingAnchor, constant: -30),

            shardButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            shardButton.bottomAnchor.constraint(equalTo: iconImageView.bottomAnchor)
        ])
        
    }
    
}
