//
//  AppSmallItemCollectionHeaderView.swift
//  example_appStoreClone_code
//
//  Created by 염성필 on 2023/05/09.
//

import UIKit


// MARK: - SmallItem Cell의 헤더부분
class AppSmallItemCollectionHeaderView: UICollectionViewCell {
    
    private lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.darkGray
        return view
    }()
    
    private lazy var mainTitle: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var showButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.link, for: .normal)
        button.setTitle("show_all_title".localized, for: .normal)
        button.backgroundColor = .clear
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
        addSubview(lineView)
        addSubview(mainTitle)
        addSubview(showButton)
        
        lineView.translatesAutoresizingMaskIntoConstraints = false
        mainTitle.translatesAutoresizingMaskIntoConstraints = false
        showButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            lineView.heightAnchor.constraint(equalToConstant: 1),
            lineView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 4),
            lineView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            lineView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 4),
            
            mainTitle.leadingAnchor.constraint(equalTo: lineView.leadingAnchor),
            mainTitle.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 5),
            mainTitle.trailingAnchor.constraint(equalTo: showButton.leadingAnchor, constant: 10),
            mainTitle.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            showButton.centerYAnchor.constraint(equalTo: mainTitle.centerYAnchor),
            showButton.trailingAnchor.constraint(equalTo: lineView.trailingAnchor),
        ])
    }
    
    func setup(mainText: String?) {
        mainTitle.text = mainText
    }
}
