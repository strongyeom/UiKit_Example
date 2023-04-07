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
        
        DispatchQueue.global().async {
            
            guard let data = try? Data(contentsOf: url) else { return }
            
            guard urlString == url.absoluteString else { return }
            
            DispatchQueue.main.async {
                // screenShot1, screenShot2, screenShot3
                self.iconImage.image = UIImage(data: data)
            }
        }
    }
    
    /// 첫번째 스샷 세팅하는 메서드
    func firstScreenShotLoadImage() {
        
        guard let urlString = firstScreenShotUrl, let url = URL(string: urlString) else { return }
        
        DispatchQueue.global().async {
            
            guard let data = try? Data(contentsOf: url) else { return }
            
            guard urlString == url.absoluteString else { return }
            
            DispatchQueue.main.async {
                self.screenShot1.image = UIImage(data: data)
            }
        }
    }
    /// 두번째 스샷 세팅하는 메서드
    func secondScreenShotLoadImage() {
        
        guard let urlString = secondScreenShotUrl, let url = URL(string: urlString) else { return }
        
        DispatchQueue.global().async {
            
            guard let data = try? Data(contentsOf: url) else { return }
            
            guard urlString == url.absoluteString else { return }
            
            DispatchQueue.main.async {
                self.screenShot2.image = UIImage(data: data)
            }
        }
    }
    /// 세번째 스샷 세팅하는 메서드
    func thirdScreenShotLoadImage() {
        
        guard let urlString = thirdScreenShotUrl, let url = URL(string: urlString) else { return }
        
        DispatchQueue.global().async {
            
            guard let data = try? Data(contentsOf: url) else { return }
            
            guard urlString == url.absoluteString else { return }
            
            DispatchQueue.main.async {
                self.screenShot3.image = UIImage(data: data)
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
