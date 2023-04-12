//
//  CollectionViewCell.swift
//  example_iTunesAPI_part2_codebase
//
//  Created by 염성필 on 2023/04/12.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    // MARK: Properties
    
    //IconImage
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 8
        // conerRadius 할때 꼭 같이 써주기
        imageView.clipsToBounds = true
        return imageView
    }()
    
    // appName
    let appName: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 15)
        title.textColor = .black
        return title
    }()
    
    // appDescription
    let appDescription: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 12)
        title.textColor = .gray
        title.numberOfLines = 1
        return title
    }()
    
    // reviewText
    let reviewText: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 10)
        title.textColor = .gray
        return title
    }()
    
    // downLoadButton
    let downLoadButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .gray
        button.setTitle("받기", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.layer.cornerRadius = 12
        button.clipsToBounds = true
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        return button
    }()
    
    // MARK: - VStack
    lazy var vStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [appName, appDescription, reviewText])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 1
        return stackView
    }()
   
    // MARK: - HStack
    lazy var hStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [iconImageView, vStack])
        stackView.axis = .horizontal
        stackView.spacing = 10
        //stackView.alignment = .top
        stackView.distribution = .fill
        stackView.backgroundColor = .yellow
        return stackView
    }()
    
    // screenShot1
    let screenShot1: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 8
        // conerRadius 할때 꼭 같이 써주기
        imageView.clipsToBounds = true
        return imageView
    }()
    
    // screenShot2
    let screenShot2: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 8
        // conerRadius 할때 꼭 같이 써주기
        imageView.clipsToBounds = true
        return imageView
    }()
    
    // screenShot3
    let screenShot3: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 8
        // conerRadius 할때 꼭 같이 써주기
        imageView.clipsToBounds = true
        return imageView
    }()
    
    
    
    // MARK: - ScreenShotHStack
    lazy var screenShotHStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [screenShot1, screenShot2, screenShot3])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.alignment = .fill
        return stackView
    }()
    
    
    // MARK: - HStack + ScreenShotHStack
//    lazy var integrationStack: UIStackView = {
//        let stackView = UIStackView(arrangedSubviews: [hStack, screenShotHStack])
//        stackView.axis = .vertical
//        stackView.spacing = 10
//        return stackView
//    }()
//
//
    
    
 
    // MARK: LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        render()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func render() {
        addSubview(hStack)
        addSubview(downLoadButton)
        addSubview(screenShotHStack)
        hStack.translatesAutoresizingMaskIntoConstraints = false
        downLoadButton.translatesAutoresizingMaskIntoConstraints = false
        //integrationStack.translatesAutoresizingMaskIntoConstraints = false
        screenShotHStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            iconImageView.widthAnchor.constraint(equalToConstant: 50),
            iconImageView.heightAnchor.constraint(equalToConstant: 50),
            
            
            hStack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            hStack.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            
            downLoadButton.centerYAnchor.constraint(equalTo: hStack.centerYAnchor),
            downLoadButton.widthAnchor.constraint(equalToConstant: 50),
            downLoadButton.leadingAnchor.constraint(equalTo: hStack.trailingAnchor, constant: 10),
            downLoadButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            screenShotHStack.topAnchor.constraint(equalTo: hStack.bottomAnchor, constant: 10),
            screenShotHStack.leadingAnchor.constraint(equalTo: hStack.leadingAnchor),
            screenShotHStack.trailingAnchor.constraint(equalTo: downLoadButton.trailingAnchor)
        ])
        
        
        
        
    }
    
    
}
