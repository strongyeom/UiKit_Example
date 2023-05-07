//
//  TodaySmallItemCollectionReusableView.swift
//  example_appStoreClone_code
//
//  Created by 염성필 on 2023/05/07.
//

import UIKit

class TodaySmallItemCollectionHearderView: UICollectionReusableView {
        
    
    // MARK: - Properties
    lazy var subText: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.darkGray
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    lazy var mainText: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.label
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.numberOfLines = 2
        return label
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
        addSubview(subText)
        addSubview(mainText)
        
        subText.translatesAutoresizingMaskIntoConstraints = false
        mainText.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            subText.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 36),
            subText.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            subText.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 16),
            
            mainText.topAnchor.constraint(equalTo: subText.bottomAnchor, constant: 10),
            mainText.leadingAnchor.constraint(equalTo: subText.leadingAnchor),
            mainText.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainText.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func setup(mainText: String?, subText: String?) {
        self.mainText.text = mainText
        self.subText.text = subText
    }
}
