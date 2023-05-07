//
//  TodayLargeItemCollectionViewCell.swift
//  example_appStoreClone_code
//
//  Created by 염성필 on 2023/05/07.
//

import UIKit

class TodayLargeItemCollectionViewCell: UICollectionViewCell {
    
    
    // MARK: - Properties

    // subtitle
    let subTitle: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.darkGray
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    // mainTitle
    let mainTitle: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.label
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        return label
    }()
    // bottomTitle
    let bottomTitle: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.darkGray
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    // 배경 이미지
    lazy var imageView: DownloadableImageView = {
        let imageView = DownloadableImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = UIColor(named: "white,darkgray")
        imageView.layer.cornerRadius = 15
        imageView.clipsToBounds = true
        return imageView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        addSubview(subTitle)
        addSubview(mainTitle)
        addSubview(bottomTitle)
        addSubview(imageView)
        
        subTitle.translatesAutoresizingMaskIntoConstraints = false
        mainTitle.translatesAutoresizingMaskIntoConstraints = false
        bottomTitle.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            imageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            imageView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            subTitle.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            subTitle.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 20),
            subTitle.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 20),
            
            
            mainTitle.leadingAnchor.constraint(equalTo: subTitle.leadingAnchor),
            mainTitle.topAnchor.constraint(equalTo: subTitle.bottomAnchor, constant: 10),
            mainTitle.trailingAnchor.constraint(equalTo: subTitle.trailingAnchor),
            
            
            
            bottomTitle.leadingAnchor.constraint(equalTo: subTitle.leadingAnchor),
            bottomTitle.trailingAnchor.constraint(equalTo: subTitle.trailingAnchor),
            bottomTitle.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
        
        // 그림자 설정
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = .zero
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 10
        self.layer.masksToBounds = false
        
    }
    
    func setup(largeItem: TodayLargeItem) {
        
        // 이미지 또는 url를 받아 보여줍니다.
        if let imageUrl = largeItem.imageURL {
            imageView.downloadImage(url: imageUrl)
        } else if let image = largeItem.image {
            imageView.image = image
        }
        
        subTitle.text = largeItem.subText
        subTitle.textColor = largeItem.subTitleColor
        mainTitle.text = largeItem.mainText
        mainTitle.textColor = largeItem.mainTitleColor
        bottomTitle.text = largeItem.bottomText
        bottomTitle.textColor = largeItem.bottomTitleColor
    }
    
    // 이미지랑 텍스트를 초기화
    override func prepareForReuse() {
        imageView.image = nil
        mainTitle.text = ""
        subTitle.text = ""
        bottomTitle.text = ""
    }
    
}
