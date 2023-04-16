//
//  AccountProfileView.swift
//  example_CompositionalCollectionView
//
//  Created by 염성필 on 2023/04/15.
//

import UIKit

// 화면의 오른쪽 상단버튼
class AccountProfileView: UIView {
    
    private lazy var profileView: DownloadableImageView = {
        let imageView = DownloadableImageView(frame: .zero)
        imageView.backgroundColor = .label
        imageView.image = UIImage(named: "screenShot1")
        return imageView
    }()
    
    init() {
        super.init(frame: .zero)
        setupLayout()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        addSubview(profileView)
        profileView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profileView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            profileView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            profileView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            profileView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
            
            self.layer.cornerRadius = 15
            self.clipsToBounds = true
            self.backgroundColor = .label
        ])
    }
    
}
