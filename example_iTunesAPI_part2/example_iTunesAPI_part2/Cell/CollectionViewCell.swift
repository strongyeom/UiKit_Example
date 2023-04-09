//
//  CollectionViewCell.swift
//  example_iTunesAPI_part2
//
//  Created by 염성필 on 2023/04/01.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var subLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var downLoadButton: UIButton!
    
    @IBOutlet weak var screenShot1: UIImageView!
    @IBOutlet weak var screenShot2: UIImageView!
    @IBOutlet weak var screenShot3: UIImageView!
    // imageIcon
    var imageIconUrl: String? {
        didSet {
            loadImage()
        }
    }
    // screenShot1
    var firstScreenShotUrl: String? {
        didSet {
            firstScreenShotLoadImage()
        }
    }
    // screenShot2
    var secondScreenShotUrl: String? {
        didSet {
            secondScreenShotLoadImage()
        }
    }
    // screenShot3
    var thirdScreenShotUrl: String? {
        didSet {
            thirdScreenShotLoadImage()
        }
    }
    
    /// IconImage 세팅하는 메서드
    func loadImage() {
        
        guard let urlString = imageIconUrl, let url = URL(string: urlString) else { return }
        let cacheKey = NSString(string: urlString) // 캐시에 사용될 key 값
        
        // 해당 key에 캐시 이미지가 저장되어 있으면 이미지를 사용
        if let cachedImage = ImageCacheManager.shared.object(forKey: cacheKey) {
            print("imageIconUrl - ⭐️ 해당 이미지가 캐시이미지에 저장되어 있음")
            self.iconImage.image = cachedImage
            return
        }
        
        DispatchQueue.global().async {
            
            guard let data = try? Data(contentsOf: url) else { return }
            
            guard urlString == url.absoluteString else { return }
            
            DispatchQueue.main.async {
                guard let image = UIImage(data: data) else { return }
                // 다운로드된 이미지를 캐시에 저장
                print("imageIconUrl - ❗️캐시 이미지에 이미지가 없다면 다운로드된 이미지를 캐시에 저장")
                ImageCacheManager.shared.setObject(image, forKey: cacheKey)
                self.iconImage.image = image
            }
        }
    }
    
    /// 첫번째 스샷 세팅하는 메서드
    func firstScreenShotLoadImage() {
        
        guard let urlString = firstScreenShotUrl, let url = URL(string: urlString) else { return }
        let cacheKey = NSString(string: urlString) // 캐시에 사용될 key 값
        
        // 해당 key에 캐시 이미지가 저장되어 있으면 이미지를 사용
        if let cachedImage = ImageCacheManager.shared.object(forKey: cacheKey) {
            print("firstScreenShotLoadImage - ⭐️ 해당 이미지가 캐시이미지에 저장되어 있음")
            self.screenShot1.image = cachedImage
            return
        }
        
        DispatchQueue.global().async {
            
            guard let data = try? Data(contentsOf: url) else { return }
            
            guard urlString == url.absoluteString else { return }
            
            DispatchQueue.main.async {
                print("firstScreenShotLoadImage - ❗️캐시 이미지에 이미지가 없다면 다운로드된 이미지를 캐시에 저장")
                guard let image = UIImage(data: data) else { return }
                ImageCacheManager.shared.setObject(image, forKey: cacheKey)
                self.screenShot1.image = image
            }
        }
    }
    /// 두번째 스샷 세팅하는 메서드
    func secondScreenShotLoadImage() {
        
        guard let urlString = secondScreenShotUrl, let url = URL(string: urlString) else { return }
        
        let cacheKey = NSString(string: urlString)
        
        if let cacheImage =  ImageCacheManager.shared.object(forKey: cacheKey) {
            print("secondScreenShotLoadImage - ⭐️ 해당 이미지가 캐시이미지에 저장되어 있음")
            self.screenShot2.image = cacheImage
            return
        }
        DispatchQueue.global().async {
            
            guard let data = try? Data(contentsOf: url) else { return }
            
            guard urlString == url.absoluteString else { return }
            
            DispatchQueue.main.async {
                
                guard let image = UIImage(data: data) else { return }
                print("secondScreenShotLoadImage - ❗️캐시 이미지에 이미지가 없다면 다운로드된 이미지를 캐시에 저장")
                ImageCacheManager.shared.setObject(image, forKey: cacheKey)
                self.screenShot2.image = image
            }
        }
    }
    /// 세번째 스샷 세팅하는 메서드
    func thirdScreenShotLoadImage() {
        
        guard let urlString = thirdScreenShotUrl, let url = URL(string: urlString) else { return }
        
        let cacheKey = NSString(string: urlString)
        if let cachedImage = ImageCacheManager.shared.object(forKey: cacheKey) {
            print("thirdScreenShotLoadImage - ⭐️ 해당 이미지가 캐시이미지에 저장되어 있음")
            self.screenShot3.image = cachedImage
            return
        }
        DispatchQueue.global().async {
            
            guard let data = try? Data(contentsOf: url) else { return }
            
            guard urlString == url.absoluteString else { return }
            
            DispatchQueue.main.async {
                guard let image = UIImage(data: data) else { return }
                ImageCacheManager.shared.setObject(image, forKey: cacheKey)
                print("thirdScreenShotLoadImage - ❗️캐시 이미지에 이미지가 없다면 다운로드된 이미지를 캐시에 저장")
                self.screenShot3.image = image
            }
        }
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        iconImage.layer.cornerRadius = 8
        screenShot1.layer.cornerRadius = 8
        screenShot2.layer.cornerRadius = 8
        screenShot3.layer.cornerRadius = 8
        
        downLoadButton.layer.cornerRadius = 12
    }
    

    
    
    
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.iconImage.image = nil
        self.screenShot1.image = nil
        self.screenShot2.image = nil
        self.screenShot3.image = nil
    }
    
    
    
    
    @IBAction func tabDownLoadButton(_ sender: UIButton) {
        print("메인화면의 버튼이 눌렸습니다.")
    }
    
}
