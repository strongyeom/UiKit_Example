//
//  FullScreenViewController.swift
//  example_iTunesAPI_part2
//
//  Created by 염성필 on 2023/04/06.
//

import UIKit

class FullScreenViewController: UIViewController {
    
    // 전 뷰에서 넘어온 appStores.screenShotUrls 넘어왔음 String
    var imageUrl: [String]?
    
    @IBOutlet var resizeImageCollection: [UIImageView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupImage()
    }
    
    func setupImage() {
        var a1: [URL] = []
        guard let screenShotUrls = imageUrl else { return }
        for i in screenShotUrls {
            a1.append(URL(string: i)!)
        }
        
        print("FullScreen으로 들어온 배열 \(a1)")
        print("FullScreen으로 들어온 URL 갯수 \(a1.count)")
        print("FullScreen에 있는 스샷컬렉션 갯수 \(resizeImageCollection.count)")
        
        for j in 0..<a1.count {
            if j <= resizeImageCollection.count-1 {
                DispatchQueue.global().async {
                    guard let data = try? Data(contentsOf: a1[j]) else { return }
                    DispatchQueue.main.async {
                        self.resizeImageCollection[j].image = UIImage(data: data)
                        self.resizeImageCollection[j].layer.cornerRadius = 8

                    }
                }
            } else {
                break
            }
        }
        
        
    }
    
    @IBAction func tabButtonClicked(_ sender: UIButton) {
        print("FullScreenViewController - dismiss")
        dismiss(animated: true)
    }
    

}
