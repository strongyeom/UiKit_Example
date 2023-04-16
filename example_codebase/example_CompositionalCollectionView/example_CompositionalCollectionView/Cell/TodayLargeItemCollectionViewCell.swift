//
//  TodayLargeItemCollectionViewCell.swift
//  example_CompositionalCollectionView
//
//  Created by 염성필 on 2023/04/15.
//

import UIKit

class TodayLargeItemCollectionViewCell: UICollectionViewCell {
    // subTitle
    var subTitle: UILabel = {
        let title = UILabel()
        title.numberOfLines = 0
        title.font = .systemFont(ofSize: 20)
        title.textColor = .darkGray
        return title
    }()
    
    // mainTitle
    var mainTitle: UILabel = {
        let title = UILabel()
        title.font = .systemFont(ofSize: 30, weight: .semibold)
        title.numberOfLines = 0
        title.textColor = .label
        return title
    }()
    
    // bottomTitle
    var bottomTitle: UILabel = {
        let title = UILabel()
        title.font = .systemFont(ofSize: 20)
        title.numberOfLines = 0
        title.textColor = .darkGray
        return title
    }()
    
    // downLoadImage
    private lazy var imageView: DownloadableImageView = {
        let imageView = DownloadableImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .darkGray
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
            imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            subTitle.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            subTitle.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            subTitle.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20)
        
            mainTitle.topAnchor.constraint(equalTo: subTitle.bottomAnchor, constant: 20)
        
        ])
        
        
        
    }
}
