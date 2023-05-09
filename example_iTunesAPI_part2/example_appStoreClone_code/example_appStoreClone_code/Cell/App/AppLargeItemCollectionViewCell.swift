//
//  AppLargeItemCollectionViewCell.swift
//  example_appStoreClone_code
//
//  Created by 염성필 on 2023/05/09.
//

import UIKit

class AppLargeItemCollectionViewCell: UICollectionViewCell {
    
    
    // MARK: - Properties
    private lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.darkGray
        return view
    }()
    
    private lazy var subTitle: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.link
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    private lazy var mainTitle: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.label
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        return label
    }()
    
    private lazy var mainInfoTitle: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.label
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        return label
    }()
    
    private lazy var imageView: DownloadableImageView = {
        let image = DownloadableImageView(frame: .zero)
        image.contentMode = .scaleAspectFill
        image.backgroundColor = UIColor(named: "white,darkgray")
        image.layer.cornerRadius = 15
        image.clipsToBounds = true
        return image
    }()
    
    // MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        addSubview(lineView)
        addSubview(subTitle)
        addSubview(mainTitle)
        addSubview(imageView)
        
        lineView.translatesAutoresizingMaskIntoConstraints = false
        subTitle.translatesAutoresizingMaskIntoConstraints = false
        mainTitle.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            lineView.heightAnchor.constraint(equalToConstant: 1),
            lineView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            lineView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            lineView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            
            subTitle.leadingAnchor.constraint(equalTo: lineView.leadingAnchor),
            subTitle.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 5),
            subTitle.trailingAnchor.constraint(equalTo: lineView.trailingAnchor),
            
            mainTitle.leadingAnchor.constraint(equalTo: lineView.leadingAnchor),
            mainTitle.topAnchor.constraint(equalTo: subTitle.bottomAnchor, constant: 5),
            mainTitle.trailingAnchor.constraint(equalTo: lineView.trailingAnchor),
            
            mainInfoTitle.leadingAnchor.constraint(equalTo: lineView.leadingAnchor),
            mainInfoTitle.topAnchor.constraint(equalTo: mainTitle.bottomAnchor, constant: 5),
            mainInfoTitle.trailingAnchor.constraint(equalTo: lineView.trailingAnchor),
            
            imageView.heightAnchor.constraint(equalToConstant: self.frame.width * 0.7),
            imageView.leadingAnchor.constraint(equalTo: lineView.leadingAnchor),
            imageView.topAnchor.constraint(equalTo: mainInfoTitle.bottomAnchor, constant: 10),
            imageView.trailingAnchor.constraint(equalTo: lineView.trailingAnchor),
            
            
        ])
        
    }
    
    // 데이터 설정
    func setup(item: AppLargeItem) {
        subTitle.text = item.subText
        subTitle.backgroundColor = item.subTextColor
        
        mainTitle.text = item.mainText
        mainTitle.backgroundColor = item.mainTextColor
        
        mainInfoTitle.text = item.mainInfoText
        mainInfoTitle.backgroundColor = item.mainInfoTextColor
        
        if let imageurl = item.imageURL {
            imageView.downloadImage(url: imageurl)
        } else if let image = item.image {
            imageView.image = image
        }
    }
    
}
