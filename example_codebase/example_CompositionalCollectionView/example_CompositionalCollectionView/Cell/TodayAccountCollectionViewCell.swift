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
    
    // 투데이
    var todayLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 34, weight: .medium)
        label.textColor = .black
        return label
    }()
    
    
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
        [dateLabel, todayLabel].forEach { addSubview($0)}
        
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            dateLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            
            todayLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 10),
            todayLabel.leadingAnchor.constraint(equalTo: dateLabel.leadingAnchor)
        
        
        ])
        
        
    }
    
    
    
}
