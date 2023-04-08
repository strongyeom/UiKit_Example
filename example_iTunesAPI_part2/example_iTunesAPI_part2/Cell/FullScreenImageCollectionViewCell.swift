//
//  FullScreenImageCollectionViewCell.swift
//  example_iTunesAPI_part2
//
//  Created by 염성필 on 2023/04/06.
//

import UIKit

class FullScreenImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var fullScreenShot: UIImageView!
    
    var fullImageUrl: String? {
        didSet {
            fullLoadImage()
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        fullScreenShot.contentMode = .scaleAspectFit
        fullScreenShot.backgroundColor = .red
    }
    
    func fullLoadImage() {
        guard let urlString = fullImageUrl, let url = URL(string: urlString) else { return }
        
        DispatchQueue.global().async {
            
            guard let data = try? Data(contentsOf: url) else { return }
            
            guard urlString == url.absoluteString else { return }
            
            DispatchQueue.main.async {
                self.fullScreenShot.image = UIImage(data: data)
            }
        }
    }

}
