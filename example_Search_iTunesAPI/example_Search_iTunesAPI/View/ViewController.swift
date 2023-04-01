//
//  ViewController.swift
//  example_Search_iTunesAPI
//
//  Created by 염성필 on 2023/03/31.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let flowLayout = UICollectionViewFlowLayout()
    
    let networkManager = NetworkManager.shared
    
    var iTunesArray: [ITunes] = []
    
    let searchController = UISearchController()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionViewLayOut()
        setupData()
        setupSearchBar()
    }
    
    func setupSearchBar() {
        self.title = "Search"
        
        navigationItem.searchController = searchController
        searchController.searchBar.autocapitalizationType = .none
        searchController.searchBar.delegate = self
    }
    
    func setupCollectionViewLayOut() {
        collectionView.dataSource = self
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 20
        let collectionCellWidth = UIScreen.main.bounds.width
        let collectuinCellHeight = UIScreen.main.bounds.height * 0.5
        flowLayout.itemSize = CGSize(width: collectionCellWidth, height: collectuinCellHeight)
        
        collectionView.collectionViewLayout = flowLayout
    }
    
    
    func setupData() {
        self.iTunesArray = []
        
        networkManager.fetchiTunes(term: "game") { result in
            if let result = result {
                self.iTunesArray = result
            }
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }

    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return iTunesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.mainLabel.text = iTunesArray[indexPath.item].trackName
        cell.subLabel.text = iTunesArray[indexPath.item].releaseNotes
        cell.reviewLabel.text = iTunesArray[indexPath.item].averageRating
        cell.imageIconUrl = iTunesArray[indexPath.item].artworkUrl100
        let screenShotUrls = iTunesArray[indexPath.item].screenshotUrls
        
        if screenShotUrls!.count > 0 {
            cell.firstScreenImageUrl = iTunesArray[indexPath.item].screenshotUrls![0]
            cell.secondScreenImageUrl = iTunesArray[indexPath.item].screenshotUrls![1]
            cell.thirdScreenImageUrl = iTunesArray[indexPath.item].screenshotUrls![2]
        }
        
        return cell
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchController.searchBar.text else { return }
        
        self.iTunesArray = []
        
        networkManager.fetchiTunes(term: text) { result in
            if let result = result {
                self.iTunesArray = result
            }
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        self.view.endEditing(true)
    }
}
