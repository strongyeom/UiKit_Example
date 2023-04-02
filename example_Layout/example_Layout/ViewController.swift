//
//  ViewController.swift
//  example_Layout
//
//  Created by 염성필 on 2023/04/02.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    
    let arrays: [Example] = [
        Example(mainTitle: "메인 첫번째", subTitle: "서브 첫번째", reivewTitle: "리뷰 첫번째", imageTitle: UIImage(named: "image1")!, screenShot: UIImage(named: "image9")!),
        Example(mainTitle: "메인 두번째", subTitle: "서브 두번째서브 두번째서브 두번째서브 두번째서브 두번째서브 두번째서브 두번째", reivewTitle: "리뷰 두번째", imageTitle: UIImage(named: "image2")!, screenShot: UIImage(named: "image9")!),
        Example(mainTitle: "메인 세번째", subTitle: "서브 세번째", reivewTitle: "리뷰 세번째", imageTitle: UIImage(named: "image3")!, screenShot: UIImage(named: "image9")!),
        Example(mainTitle: "메인 넷번째", subTitle: "서브 넷번째", reivewTitle: "리뷰 넷번째", imageTitle: UIImage(named: "image4")!, screenShot: UIImage(named: "image9")!),
        Example(mainTitle: "메인 다섯 번째", subTitle: "서브 다섯 번째", reivewTitle: "리뷰 다섯 번째", imageTitle: UIImage(named: "image5")!, screenShot: UIImage(named: "image9")!),
        Example(mainTitle: "메인 여섯 번째", subTitle: "서브 여섯 번째", reivewTitle: "리뷰 여섯 번째", imageTitle: UIImage(named: "image6")!, screenShot: UIImage(named: "image9")!),
        Example(mainTitle: "메인 일곱 번째", subTitle: "서브 일곱 번째", reivewTitle: "리뷰 일곱 번째", imageTitle: UIImage(named: "image7")!, screenShot: UIImage(named: "image9")!),
        Example(mainTitle: "메인 여덟 번째", subTitle: "서브 여덟 번째", reivewTitle: "리뷰 여덟 번째", imageTitle: UIImage(named: "image8")!, screenShot: UIImage(named: "image9")!)
    ]
    
    let flowLayout = UICollectionViewFlowLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: String(describing: CollectionViewCell.self), bundle: .main), forCellWithReuseIdentifier: String(describing: CollectionViewCell.self))
        
        
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 20
        let collectionViewWidth = UIScreen.main.bounds.width
        let collectionViewHeight = UIScreen.main.bounds.height * 0.5
        flowLayout.itemSize = CGSize(width: collectionViewWidth, height: collectionViewHeight)
        
        collectionView.collectionViewLayout = flowLayout
    }
    
    
    
    
    
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrays.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CollectionViewCell.self), for: indexPath) as! CollectionViewCell
        cell.mainLabel.text = arrays[indexPath.item].mainTitle
        cell.subLabel.text = arrays[indexPath.item].subTitle
        cell.reviewLabel.text = arrays[indexPath.item].reivewTitle
        cell.iconImageVIew.image = arrays[indexPath.item].imageTitle
        cell.screenShot1.image = arrays[indexPath.item].screenShot
        cell.screenShot2.image = arrays[indexPath.item].screenShot
        cell.screenShot3.image = arrays[indexPath.item].screenShot
        return cell
    }
}
