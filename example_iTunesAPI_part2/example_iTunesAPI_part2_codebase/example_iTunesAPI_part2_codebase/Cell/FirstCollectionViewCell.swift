//
//  FirstCollectionViewCell.swift
//  example_iTunesAPI_part2_codebase
//
//  Created by 염성필 on 2023/04/14.
//

import UIKit

class FirstCollectionViewCell: UICollectionViewCell {
    
    
    // MARK: - Properties
    
    // IconImage
    var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        return imageView
    }()
    
    // APP Name
    var appName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.textColor = .black
        return label
    }()
    
    // Description
    var appDescription: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 1
        label.textColor = .systemGray
        return label
    }()
    
    // downLoadBtn
    var downLoadButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("받기", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.titleLabel?.textColor = .white
        button.layer.cornerRadius = 12
        button.backgroundColor = .blue
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
        let stack = UIStackView(arrangedSubviews: [appName, appDescription, downLoadButton])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 5
        return stack
    }()
    
    
    // MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        addSubview(iconImageView)
        addSubview(textStack)
        addSubview(shardButton)
        
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        textStack.translatesAutoresizingMaskIntoConstraints = false
        shardButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            iconImageView.widthAnchor.constraint(equalToConstant: 100),
            iconImageView.heightAnchor.constraint(equalToConstant: 100),
            downLoadButton.widthAnchor.constraint(equalToConstant: 60),
            
            iconImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            iconImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            
            textStack.topAnchor.constraint(equalTo: iconImageView.topAnchor),
            textStack.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 10),
            textStack.bottomAnchor.constraint(equalTo: iconImageView.bottomAnchor),
            
            shardButton.leadingAnchor.constraint(equalTo: textStack.trailingAnchor, constant: 10),
            shardButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 10),
            shardButton.bottomAnchor.constraint(equalTo: textStack.bottomAnchor)
        
        ])
        
        
    }
    
    override func prepareForReuse() {
        iconImageView.image = nil
        appName.text = nil
        appDescription.text = nil
        downLoadButton.titleLabel?.text = nil
        shardButton.imageView?.image = nil
    }
    
    
    
}
