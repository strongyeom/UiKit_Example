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
    
  
    
    // 네트워크 불러오기
    let networkManager = NetworkManager.shared
    
    // 담을 수있는 빈 배열 만들기
    var iTunesAPIs: [ITunes] = []
    
    // searchController 생성
    let searchController = UISearchController()
    
    
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationItem.title = "Search"
        
        setup()
        setupNetwokring()
        setupSearch()
        
        
        
    }
    
    func setupSearch() {
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        searchController.searchBar.autocapitalizationType = .none
    }
    
    func setupNetwokring() {
        
        iTunesAPIs = []
        // 네트워킹 시작
        networkManager.fetchRequest(searchTerm: "game") { result in
            if let result = result {
                // 데이터(배열)을 받아오고 난 후
                self.iTunesAPIs = result
            }
            // 콜렉션뷰 리로드
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
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


// MARK: - UICollectionViewDataSource
extension ViewController: UICollectionViewDataSource {
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return iTunesAPIs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CollectionViewCell.self), for: indexPath) as! CollectionViewCell
        cell.appName.text = iTunesAPIs[indexPath.item].trackName
        cell.appDescription.text = iTunesAPIs[indexPath.item].description
        cell.reviewText.text = iTunesAPIs[indexPath.item].averageRating
        cell.imageIconUrl = iTunesAPIs[indexPath.item].artworkUrl60
        cell.screenShot1.image = UIImage(named: "screenSho1")
        cell.screenShot2.image = UIImage(named: "screenSho2")
        cell.screenShot3.image = UIImage(named: "screenSho3")
        
        let mainScreenShot = iTunesAPIs[indexPath.item].screenshotUrls
        
        if mainScreenShot!.count > 0 {
            cell.screenShot1Url = mainScreenShot![0]
            cell.screenShot2Url = mainScreenShot![1]
            cell.screenShot3Url = mainScreenShot![2]
        }

        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        CGSize(width: view.frame.width, height: 250)
    }
}

// MARK: - UICollectionViewDelegate
extension ViewController: UICollectionViewDelegate {
    // cell이 눌러졌을때 액션
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let example = DetailViewController()
        example.detailITunes = iTunesAPIs[indexPath.item]
        //print(example.detailITunes)
        navigationController?.pushViewController(example, animated: true)
    }
}

// MARK: - UISearchBarDelegate
extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchController.searchBar.text else { return }
        
        self.iTunesAPIs = []
        
        networkManager.fetchRequest(searchTerm: text) { result in
            if let result = result {
                self.iTunesAPIs = result
            }
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        self.view.endEditing(true)
       
    }
}

