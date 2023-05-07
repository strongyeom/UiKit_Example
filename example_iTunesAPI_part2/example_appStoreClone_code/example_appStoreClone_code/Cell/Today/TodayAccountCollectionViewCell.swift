//
//  TodayAccountCollectionViewCell.swift
//  example_appStoreClone_code
//
//  Created by 염성필 on 2023/05/07.
//

import UIKit

class TodayAccountCollectionViewCell: UICollectionViewCell {
    
    
    // MARK: - properties
    // 날짜 lazy var를 쓴이유 : currentDate에서 먼저 받아와야 하기 때문에
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.darkGray
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        // 현재 날짜 가져오기
        label.text = currentDate
        return label
    }()
    // 투데이 글자
    let largeTitle: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 34, weight: .semibold)
        label.text = "today_title".localized
        return label
    }()
    
    // 현재 날짜 가져오기
    var currentDate: String {
        let dataFormatter = DateFormatter()
        dataFormatter.dateFormat = "MM.dd.E"
        dataFormatter.locale = Locale(identifier: Locale.current.identifier)
        return dataFormatter.string(from: Date())
    }
    
    // MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTitle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTitle() {
        addSubview(dateLabel)
        addSubview(largeTitle)
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        largeTitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            dateLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            dateLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            
            largeTitle.leadingAnchor.constraint(equalTo: dateLabel.leadingAnchor),
            largeTitle.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 10),
            largeTitle.trailingAnchor.constraint(equalTo: dateLabel.trailingAnchor),
            largeTitle.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        
        
        ])
    }
}
