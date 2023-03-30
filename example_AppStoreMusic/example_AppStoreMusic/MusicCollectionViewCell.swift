//
//  MusicCollectionViewCell.swift
//  example_AppStoreMusic
//
//  Created by 염성필 on 2023/03/30.
//

import UIKit

class MusicCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var mainImageView: UIImageView!
    
    var imageUrl: String? {
        didSet {
            loadImage()
        }
    }
    
    // URL => 이미지를 세팅하는 메서드
    func loadImage() {
        guard let urlString = imageUrl, let url = URL(string: urlString) else { return }
        
        // 오래 걸리는 작업을 동시성 처리 ( 다른 쓰레드에서 일시킴 )
        DispatchQueue.global().async {
            // URL을 가지고 데이터를 만드는 메서드 (오래걸리는데 동기적인 실행)
            // (일반적으로 이미지를 가져올떄 많이 사용)
            guard let data = try? Data(contentsOf: url) else { return }
            
            // 오래걸리는 작업이 일어나고 있는 동안에 url이 바뀔 가능성 제기
            guard urlString == url.absoluteString else { return }
            
            // 작업의 결과물을 이미지로 표시 ( 메인큐)
            DispatchQueue.main.async {
                self.mainImageView.image = UIImage(data: data)
            }
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.mainImageView.image = nil
    }
    
}
