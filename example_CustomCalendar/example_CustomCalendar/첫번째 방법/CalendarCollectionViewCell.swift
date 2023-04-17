//
//  CalendarCollectionViewCell.swift
//  example_CustomCalendar
//
//  Created by 염성필 on 2023/04/17.
//

import UIKit

class CalendarCollectionViewCell: UICollectionViewCell {
    
    private lazy var dayLabel = UILabel()
    
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        addSubview(dayLabel)
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        dayLabel.font = .boldSystemFont(ofSize: 12)
        
        NSLayoutConstraint.activate([
            dayLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            dayLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        
        ])
    }
    
    func update(day: String) {
        self.dayLabel.text = day
    }
    
}
