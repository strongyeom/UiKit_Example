//
//  TodaySmallItemBackgroundView.swift
//  example_appStoreClone_code
//
//  Created by 염성필 on 2023/05/07.
//

import UIKit

class TodaySmallItemBackgroundView: UICollectionReusableView {
        
    // MARK: - Properties
    // section 배경
    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "white,darkgray")
        view.layer.cornerRadius = 15
        view.clipsToBounds = true
        
        // 그림자 설정
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 10
        view.layer.masksToBounds = false
        return view
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
        addSubview(backgroundView)
        
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            backgroundView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            backgroundView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            backgroundView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
    }
}
