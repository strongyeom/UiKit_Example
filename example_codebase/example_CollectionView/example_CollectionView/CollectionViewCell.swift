//
//  CollectionViewCell.swift
//  example_CollectionView
//
//  Created by 염성필 on 2023/04/11.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    
    // MARK: Properties
    
    // iCon Image
    let iConImage: UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleToFill
        return imageview
    }()
    
    // maintitle
    let maintitle: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 15)
        title.textColor = .black
        return title
    }()
    
    // description
    let subDescription: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 12)
        title.textColor = .gray
        return title
    }()
    
    
    lazy var stackview: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [maintitle, subDescription])
        stackview.axis = .vertical
        stackview.spacing = 5
        stackview.distribution = .fillEqually
        return stackview
    }()
    
    lazy var horizantalStackview: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [iConImage, stackview])
        stackview.axis = .horizontal
        stackview.spacing = 10
        stackview.distribution = .fill
        return stackview
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        render()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func render() {
        addSubview(stackview)
        addSubview(horizantalStackview)
        stackview.translatesAutoresizingMaskIntoConstraints = false
        horizantalStackview.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            iConImage.widthAnchor.constraint(equalToConstant: 50),
            iConImage.heightAnchor.constraint(equalToConstant: 50),
            horizantalStackview.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            horizantalStackview.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            horizantalStackview.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
    }
    
    
    
}
