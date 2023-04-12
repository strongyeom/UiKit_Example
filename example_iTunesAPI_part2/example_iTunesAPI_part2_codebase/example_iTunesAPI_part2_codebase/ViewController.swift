//
//  ViewController.swift
//  example_iTunesAPI_part2_codebase
//
//  Created by 염성필 on 2023/04/11.
//

import UIKit

class ViewController: UIViewController {
    
    
    // MARK: Properties
    let collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 20
        let collectionview = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        return collectionview
    }()
    
    let items: [Item] = [
    Item(iconImageSting: "image1", appName: "안녕하세요1", appDescription: "여보sdasdasdsadsdsadsadasdddasdasdasdsadsdsadsadasdddasdssds세요1", reviewText: "리뷰입니다1"),
    Item(iconImageSting: "image2", appName: "안녕하세요2", appDescription: "여보세요2", reviewText: "리뷰입니다2"),
    Item(iconImageSting: "image3", appName: "안녕하세요3", appDescription: "여보세요3", reviewText: "리뷰입니다3"),
    Item(iconImageSting: "image4", appName: "안녕하세요4", appDescription: "여보세요4", reviewText: "리뷰입니다4")
    ]
    
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setup()
      
    }
    
    
    
    func setup() {
        view.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: String(describing:  CollectionViewCell.self))
        
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    
    
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CollectionViewCell.self), for: indexPath) as! CollectionViewCell
        cell.iconImageView.image = UIImage(named: items[indexPath.row].iconImageSting)
        cell.appName.text = items[indexPath.row].appName
        cell.appDescription.text = items[indexPath.row].appDescription
        cell.reviewText.text = items[indexPath.row].reviewText
        cell.screenShot1.image = UIImage(named: "screenShot1")
        cell.screenShot2.image = UIImage(named: "screenShot2")
        cell.screenShot3.image = UIImage(named: "screenShot3")
        return cell
    }
}
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        CGSize(width: view.frame.width, height: 250)
    }
}


