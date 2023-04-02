//
//  CustomView.swift
//  example_codebase
//
//  Created by 염성필 on 2023/04/02.
//

import UIKit

// 만들고자 하는 뷰
class CustomView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .systemMint
        
        let titleLabel = UILabel()
        titleLabel.text = "타리피"
        titleLabel.numberOfLines = 2
        
        let subtitleLabel = UILabel()
        subtitleLabel.text = "무려"
        
        let subtitleBg = UIView()
        subtitleBg.backgroundColor = .yellow
        
        subtitleBg.addSubview(subtitleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleBg.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            subtitleLabel.centerXAnchor.constraint(equalTo: subtitleBg.centerXAnchor),
            subtitleLabel.centerYAnchor.constraint(equalTo: subtitleBg.centerYAnchor),
            subtitleLabel.topAnchor.constraint(equalTo: subtitleBg.topAnchor, constant: 5),
            subtitleLabel.leadingAnchor.constraint(equalTo: subtitleBg.leadingAnchor, constant: 5)
        ])
        
        let bottomImageView = UIImageView(image: UIImage(systemName: "flame"))
        bottomImageView.contentMode = .scaleAspectFit
        
        bottomImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bottomImageView.heightAnchor.constraint(equalToConstant: 50),
            bottomImageView.widthAnchor.constraint(equalToConstant: 50),

        ])
        
        self.addSubview(titleLabel)
        self.addSubview(subtitleBg)
        self.addSubview(bottomImageView)
        
        NSLayoutConstraint.activate([
            // 뷰의 높이
            self.heightAnchor.constraint(equalToConstant: 200),
            
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            
            subtitleBg.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            subtitleBg.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            
            bottomImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            bottomImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        
        ])
        
    }
}
