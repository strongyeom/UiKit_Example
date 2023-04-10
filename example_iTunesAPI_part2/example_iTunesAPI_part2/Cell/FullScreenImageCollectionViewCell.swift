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
    var isCount: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        fullScreenShot.contentMode = .scaleAspectFit
        //fullScreenShot.backgroundColor = .red
    }
    

    func fullLoadImage() {
      
        
        guard let urlString = fullImageUrl, let url = URL(string: urlString) else { return }
        
        print("FullScreen - 하나씩 넘겨받음", fullImageUrl!)
        let cacheKey = NSString(string: urlString)
        
        
        

        
        if let cachedImage = ImageCacheManager.shared.object(forKey: cacheKey) {
            print("FullScreen에 캐시 이미지가 있다면 .fullScreenShot.image에 이미지 담기")
            print("FullScreenImageCollectionViewCell - fullLoadImage ⭐️ 해당 이미지가 캐시 이미지에 저장되어 있음")
            self.fullScreenShot.image = cachedImage
            
            
            return
        }
        DispatchQueue.global().async {

            guard let data = try? Data(contentsOf: url) else { return }

            guard urlString == url.absoluteString else { return }

            DispatchQueue.main.async {


                guard let image = UIImage(data: data) else { return }
                // 다운로드된 이미지를 캐시에 저장
                print("FullScreenImageCollectionViewCell - fullLoadImage ❗️캐시 이미지에 이미지가 없다면 다운로드된 이미지를 캐시에 저장")
                ImageCacheManager.shared.setObject(image, forKey: cacheKey)
                print("FullScreen 캐시 이미지에 이미지 없다면 이미지 URL로 받아오고 캐시이미지에 저장하기")
                self.fullScreenShot.image = image
            }
        }
    }

}
