//
//  CollectionViewCell.swift
//  example_Layout
//
//  Created by 염성필 on 2023/04/02.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var iconImageVIew: UIImageView!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var subLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var downLoadBtn: UIButton!
    
    @IBOutlet weak var screenShot1: UIImageView!
    @IBOutlet weak var screenShot2: UIImageView!
    @IBOutlet weak var screenShot3: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        downLoadBtn.backgroundColor = .systemGray3
        downLoadBtn.layer.cornerRadius = 12
        
    }

}
