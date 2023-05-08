//
//  TodaySmallItemCollectionViewCell.swift
//  example_appStoreClone_code
//
//  Created by 염성필 on 2023/05/07.
//

import UIKit

class TodaySmallItemCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    // image
    private lazy var imageView: DownloadableImageView = {
        let imageView = DownloadableImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.backgroundColor = .label
        return imageView
    }()
    
    let mainText: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.label
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.numberOfLines = 2
        return label
    }()
    
    let subText: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.darkGray
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    let inAppPurchaseText: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.darkGray
        label.font = UIFont.systemFont(ofSize: 13)
        label.textAlignment = .center
        return label
    }()
    
    lazy var installButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("down_title".localized, for: .normal)
        button.setTitleColor(.link, for: .normal)
        button.backgroundColor = UIColor(named: "lightgray,darkgray")
        button.layer.cornerRadius = 15
        return button
    }()
    
    
    
    // MARK: - LifeCycle
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
        addSubview(inAppPurchaseText)
        addSubview(installButton)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        mainText.translatesAutoresizingMaskIntoConstraints = false
        subText.translatesAutoresizingMaskIntoConstraints = false
        inAppPurchaseText.translatesAutoresizingMaskIntoConstraints = false
        installButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 70),
            imageView.heightAnchor.constraint(equalToConstant: 70),
            imageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5),
            imageView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -5),
            
            mainText.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 5),
            mainText.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
            mainText.trailingAnchor.constraint(equalTo: installButton.leadingAnchor, constant: -16),
            
            subText.topAnchor.constraint(equalTo: mainText.bottomAnchor, constant: 5),
            subText.leadingAnchor.constraint(equalTo: mainText.leadingAnchor),
            subText.trailingAnchor.constraint(equalTo: mainText.trailingAnchor),
            
            installButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            installButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            installButton.widthAnchor.constraint(equalToConstant: 70),
            
            inAppPurchaseText.centerXAnchor.constraint(equalTo: installButton.centerXAnchor),
            inAppPurchaseText.trailingAnchor.constraint(equalTo: installButton.trailingAnchor),
            inAppPurchaseText.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            inAppPurchaseText.bottomAnchor.constraint(equalTo: imageView.bottomAnchor)
            
        
        ])
        
    }
    
    func setup(item: TodaySmallItem) {
        if let imageUrl = item.imageURL {
            self.imageView.downloadImage(url: imageUrl)
        } else if let image = item.image {
            self.imageView.image = image
        }
        
        self.mainText.text = item.mainText
        self.subText.text = item.subText
        self.inAppPurchaseText.text = "in_app_purchase".localized
        
        
    }
    
}
