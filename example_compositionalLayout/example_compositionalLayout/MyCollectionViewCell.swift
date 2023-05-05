//
//  MyCollectionViewCell.swift
//  example_compositionalLayout
//
//  Created by 염성필 on 2023/05/05.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var iconName: UILabel!
    
    
    var imageName: String = "" {
        didSet {
            self.iconImage.image = UIImage(systemName: imageName)
            self.iconName.text = imageName
        }
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
}
