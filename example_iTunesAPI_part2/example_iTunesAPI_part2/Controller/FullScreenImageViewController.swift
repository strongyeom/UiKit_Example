//
//  FullScreenImageViewController.swift
//  example_iTunesAPI_part2
//
//  Created by 염성필 on 2023/04/06.
//

import UIKit



// Todo - 풀 스크린 프레임 간격 조정 


class FullScreenImageViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let flowLayout = UICollectionViewFlowLayout()
    
   

    // 전 화면에서 ScreenShotUrl 배열 받아오기
    var fullScreenImageUrl: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollectionView()
    }
    
    func setupCollectionView() {
        
        collectionView.dataSource = self
        flowLayout.scrollDirection = .horizontal
        collectionView.isPagingEnabled = true
        flowLayout.minimumInteritemSpacing = 30
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        let collectionViewWidth = UIScreen.main.bounds.width - 10
        let collectionViewHeight = UIScreen.main.bounds.height * 0.9
        flowLayout.itemSize = CGSize(width: collectionViewWidth, height: collectionViewHeight)
        collectionView.collectionViewLayout  = flowLayout
    }
    
    @IBAction func tabButtonClicked(_ sender: UIButton) {
        print("FullScreenImageViewController 화면이 내려갑니다.")
        dismiss(animated: true)
    }

    
   
}
extension FullScreenImageViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        guard let fullScreenImageUrl = fullScreenImageUrl?.count else { return 0 }
        
        return fullScreenImageUrl
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: FullScreenImageCollectionViewCell.self), for: indexPath) as! FullScreenImageCollectionViewCell
        for i in 0..<fullScreenImageUrl!.count {
            print("FullScreen - 하나씩 넘겨줌")
            cell.fullImageUrl = fullScreenImageUrl![i]
            
        }
        return cell
    }
}

