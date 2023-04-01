//
//  CollectionViewCell.swift
//  example_Search_iTunesAPI
//
//  Created by 염성필 on 2023/03/31.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var subLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var downloadButton: UIButton!
    
    @IBOutlet weak var screenShot1: UIImageView!
    @IBOutlet weak var screenShot2: UIImageView!
    @IBOutlet weak var screenShot3: UIImageView!
    
    var imageIconUrl: String? {
        didSet {
            loadImage()
        }
    }
    
    var firstScreenImageUrl: String? {
        didSet {
            firstScreenShot()
        }
    }
    
    var secondScreenImageUrl: String? {
        didSet {
            secondScreenShot()
        }
    }
    
    var thirdScreenImageUrl: String? {
        didSet {
            thirdScreenShot()
        }
    }
    


    override func awakeFromNib() {
        super.awakeFromNib()
        downloadButton.layer.cornerRadius = 12
        iconImageView.layer.cornerRadius = 8
        screenShot1.layer.cornerRadius = 8
        screenShot2.layer.cornerRadius = 8
        screenShot3.layer.cornerRadius = 8
    }
    
    func loadImage() {
        guard let urlString = imageIconUrl, let url = URL(string: urlString) else { return }
        
        DispatchQueue.global().async {
            
            guard let data = try? Data(contentsOf: url) else { return }
            
            guard urlString == url.absoluteString else { return }
            
            DispatchQueue.main.async {
                self.iconImageView.image = UIImage(data: data)
            }
        }
    }
    
    func firstScreenShot() {
        guard let urlString = firstScreenImageUrl, let url = URL(string: urlString) else { return }
        
        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: url) else { return }
            
            guard urlString == url.absoluteString else { return }
            
            DispatchQueue.main.async {
                self.screenShot1.image = UIImage(data: data)
            }
        }
    }
    
    func secondScreenShot() {
        guard let urlString = secondScreenImageUrl, let url = URL(string: urlString) else { return }
        
        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: url) else { return }
            
            guard urlString == url.absoluteString else { return }
            
            DispatchQueue.main.async {
                self.screenShot2.image = UIImage(data: data)
            }
        }
    }
    
    func thirdScreenShot() {
        guard let urlString = thirdScreenImageUrl, let url = URL(string: urlString) else { return }
        
        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: url) else { return }
            
            guard urlString == url.absoluteString else { return }
            
            DispatchQueue.main.async {
                self.screenShot3.image = UIImage(data: data)
            }
        }
    }

    
    override func prepareForReuse() {
        self.iconImageView.image = nil
        self.screenShot1.image = nil
        self.screenShot2.image = nil
        self.screenShot3.image = nil
    }
    
    @IBAction func tabDownLoadButton(_ sender: UIButton) {
        print("다운로드 버튼이 눌렸습니다.")
    }
    
}
