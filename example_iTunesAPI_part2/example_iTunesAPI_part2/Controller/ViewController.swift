//
//  ViewController.swift
//  example_iTunesAPI_part2
//
//  Created by 염성필 on 2023/04/01.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    // collectionView 레이아웃
    let flowLayout = UICollectionViewFlowLayout()
    
    // 네트워크 불러오기
    let networkManager = NetworkManager.shared
    
    // 빈 배열 만들기
    var appStores: [ITunes] = []
    
    let searchController = UISearchController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        setupData()
        setupSearch()
    }
    
    func setupSearch() {
        //self.title = "Search"
        navigationItem.searchController = searchController
        
        searchController.searchBar.delegate = self
        searchController.searchBar.autocapitalizationType = .none
        
    }
    
    func setupCollectionView() {
        collectionView.dataSource = self
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 20
        
        let collectionViewWidth = UIScreen.main.bounds.width
        let collectionViewHeight = UIScreen.main.bounds.height * 0.5
        
        flowLayout.itemSize = CGSize(width: collectionViewWidth, height: collectionViewHeight)
        collectionView.collectionViewLayout = flowLayout
    }
    
    func setupData() {
        self.appStores = []
        networkManager.fetchRequest(term: "kakao") { result in
            if let result = result {
                self.appStores = result
            }
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }


}

extension ViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appStores.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        
        cell.imageIconUrl = appStores[indexPath.item].artworkUrl100
        cell.mainLabel.text = appStores[indexPath.item].trackName
        cell.subLabel.text = appStores[indexPath.item].description
        cell.reviewLabel.text = appStores[indexPath.item].averageRating
        
        let screenShots = appStores[indexPath.item].screenshotUrls
        if let screenShots = screenShots {
            if screenShots.count > 0 {
                cell.firstScreenShotUrl = appStores[indexPath.item].screenshotUrls![0]
                cell.secondScreenShotUrl = appStores[indexPath.item].screenshotUrls![1]
                cell.thirdScreenShotUrl = appStores[indexPath.item].screenshotUrls![2]
            }
        } else {
            print("배열을 필터하지 못함")
        }
       
        return cell
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchController.searchBar.text else { return }
        
        self.appStores = []
        
        networkManager.fetchRequest(term: text) { result in
            if let result = result {
                self.appStores = result
            }
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        self.view.endEditing(true)
    }
}
