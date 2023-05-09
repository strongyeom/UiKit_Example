//
//  AppSmallItemCollectionViewCell.swift
//  example_appStoreClone_code
//
//  Created by 염성필 on 2023/05/09.
//

import UIKit

// MARK: -  SmallItem Cell의 group 부분
class AppSmallItemCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    private lazy var imageView: DownloadableImageView = {
        let imageView = DownloadableImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .label
        imageView.layer.cornerRadius = 15
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var mainText: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var subText: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var inAppPurChase: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    private lazy var installButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("install".localized, for: .normal)
        button.setTitleColor(.link, for: .normal)
        button.backgroundColor = UIColor(named: "lightgray,darkgray")
        button.layer.cornerRadius = 15
        button.clipsToBounds = true
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        addSubview(imageView)
        addSubview(mainText)
        addSubview(subText)
        addSubview(inAppPurChase)
        addSubview(installButton)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        mainText.translatesAutoresizingMaskIntoConstraints = false
        subText.translatesAutoresizingMaskIntoConstraints = false
        inAppPurChase.translatesAutoresizingMaskIntoConstraints = false
        installButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            imageView.widthAnchor.constraint(equalToConstant: 70),
            imageView.heightAnchor.constraint(equalToConstant: 70),
            imageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 5),
            
            mainText.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 5),
            mainText.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
            mainText.trailingAnchor.constraint(equalTo: installButton.leadingAnchor, constant: 16),
        
            subText.leadingAnchor.constraint(equalTo: mainText.leadingAnchor),
            subText.topAnchor.constraint(equalTo: mainText.bottomAnchor, constant: 5),
            subText.trailingAnchor.constraint(equalTo: mainText.trailingAnchor),
            
            installButton.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
            installButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            installButton.widthAnchor.constraint(equalToConstant: 70),
        
            //inAppPurChase.leadingAnchor.constraint(equalTo: installButton.leadingAnchor),
            inAppPurChase.centerXAnchor.constraint(equalTo: installButton.centerXAnchor),
            inAppPurChase.topAnchor.constraint(equalTo: installButton.topAnchor),
            inAppPurChase.trailingAnchor.constraint(equalTo: installButton.trailingAnchor),
            inAppPurChase.bottomAnchor.constraint(equalTo: imageView.bottomAnchor)
        
        ])
    }
    
    func setup(item: AppSmallItem) {
        if let imageUrl = item.imageURL {
            imageView.downloadImage(url: imageUrl)
        } else if let image = item.image {
            imageView.image = image
        }
        mainText.text = item.mainTitle
        subText.text = item.subTitle
        inAppPurChase.text = "in_app_purchase".localized
        
        inAppPurChase.isHidden = item.isInAppPurchase
    }
}
