//
//  TodayAccountCollectionViewCell.swift
//  example_CompositionalCollectionView
//
//  Created by 염성필 on 2023/04/15.
//

import UIKit

class TodayAccountCollectionViewCell: UICollectionViewCell {
    
    // 날짜 <- 그 다음에 만들어짐 2️⃣
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.textColor = .systemGray
        label.text = currentDate
        return label
    }()
    
    // largeTitle
    var largeTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 34, weight: .medium)
        label.textColor = .black
        return label
    }()
    
    // AccountProfileView
    private lazy var accountProfileView = AccountProfileView()
    
    // 날짜 형식 변형 <- 이게 먼저 생성되고 1️⃣
    var currentDate: String {
        let dataFormatter = DateFormatter()
        dataFormatter.dateFormat = "MM. dd. E"
        dataFormatter.locale = Locale(identifier: Locale.current.identifier)
        return dataFormatter.string(from: Date())
    }
    
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        [dateLabel, largeTitle].forEach { addSubview($0)}
        
        
        NSLayoutConstraint.activate([
           
            dateLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            
            largeTitle.topAnchor.constraint(equalTo: dateLabel.bottomAnchor),
            largeTitle.leadingAnchor.constraint(equalTo: dateLabel.leadingAnchor),
            largeTitle.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
        
            // account
            accountProfileView.trailingAnchor.constraint(equalTo: dateLabel.trailingAnchor),
            accountProfileView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
            accountProfileView.widthAnchor.constraint(equalToConstant: 30),
            accountProfileView.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        
    }
    
    
    
}
