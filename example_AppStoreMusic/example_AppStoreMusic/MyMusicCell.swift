//
//  MyMusicCell.swift
//  example_AppStoreMusic
//
//  Created by 염성필 on 2023/03/30.
//

import UIKit

class MyMusicCell: UITableViewCell {
    
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var songNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var albumNameLabel: UILabel!
    @IBOutlet weak var releaseDataLabel: UILabel!
    
    // 이미지 URL을 전달하는 속성
    var imageUrl: String? {
        didSet {
            loadImage()
        }
    }
    
    // 셀이 재사용되기 전에 호출되는 메서드
    override func prepareForReuse() {
        super.prepareForReuse()
        // 일반적으로 이미지가 바뀌는 것처럼 보이는 현상을 없애기 위해서 실행
        self.mainImageView.image = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainImageView.contentMode = .scaleToFill
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    
    private func loadImage() {
        
        guard let urlString = self.imageUrl, let url = URL(string: urlString) else { return }
        
        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: url) else { return }
            
            guard urlString == url.absoluteString else { return }
            
            DispatchQueue.main.async {
                self.mainImageView.image = UIImage(data: data)
            }
        }
        
        
        
        // ⭐️ 정석
        //        guard let url = URL(string: urlString) else { return }
        //        // 비동기적으로 되어있어서 오래 걸림...
        //        URLSession.shared.dataTask(with: url) { data, response, error in
        //            // 에러가 없어야 넘어감
        //            guard error == nil else {
        //                print("Error: error calling GET")
        //                return
        //            }
        //            // 옵셔널 바인딩
        //            guard let safeData = data else {
        //                print("Error: Did not receive data")
        //                return
        //            }
        //            DispatchQueue.main.async {
        //                self.mainImageView.image = UIImage(data: safeData)
        //            }
        //        }
        //        .resume()
        //    }
        //}
    }
}
