//
//  CollectionViewCell.swift
//  example_iTunesAPI_part2_codebase
//
//  Created by 염성필 on 2023/04/12.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    // MARK: Properties
    
    // IconImage
//    let image: UIImageView = {
//        let image = UIImage(named: "image123")
//        let imageview = UIImageView()
//        imageview.image = image
//        imageview.contentMode = .scaleToFill
//        imageview.layer.cornerRadius = 8
//        return imageview
//    }()
    
    // AppName
    let appName: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 15)
        title.textColor = .black
        return title
    }()
    
    // subDescription
    let subDescription: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 10)
        title.textColor = .gray
        return title
    }()
    
    // stackView
    lazy var stackView: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [appName, subDescription])
        stackview.axis = .vertical
        stackview.distribution = .fillEqually
        stackview.spacing = 10
        return stackview
    }()
    
    
    // MARK: LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        render()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func render() {
        
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 10)
        ])
    }
    
    func configure(appName: String, subDescription: String) {
        self.appName.text = appName
        self.subDescription.text = subDescription
    }
    
    
    
}
