//
//  DetailCollectionViewCell.swift
//  example_iTunesAPI_part2_codebase
//
//  Created by 염성필 on 2023/04/14.
//

import UIKit

class DetailCollectionViewCell: UICollectionViewCell {
    
    
    // MARK: - Properties
    
    // label
    var mainLabel: UILabel = {
        let label = UILabel()
        label.text = "임시 보기용"
        return label
    }()
    
    
    // MARK: LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(mainLabel)
        
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            mainLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            mainLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            mainLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
