//
//  ViewController.swift
//  example_AppStoreClone
//
//  Created by 염성필 on 2023/03/30.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var images: [String] = ["one", "two", "three", "four"]
    var titles = ["안녕하세요" , "여보세요" , "누구세요" , "컬렉션어렵네요"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
    }


}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostCell", for: indexPath) as! PostCell
        cell.image.image = UIImage(named: images[indexPath.row])
        cell.title.text = titles[indexPath.row]
        return cell
    }
    
    
}

extension ViewController: UICollectionViewDelegate {
    
}
