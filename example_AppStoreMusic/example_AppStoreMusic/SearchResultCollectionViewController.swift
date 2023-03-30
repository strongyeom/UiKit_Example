//
//  SearchResultCollectionViewController.swift
//  example_AppStoreMusic
//
//  Created by 염성필 on 2023/03/30.
//

import UIKit

class SearchResultCollectionViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // (서치바에서) 검색을 위한 단어를 담는 변수 (ViewController에서 받음)
    var searchTerm: String? {
        didSet {
            setupData()
        }
    }
    // 네트워크 매니저 ( 싱글톤 )
    let networkManager = NetworkManager.shared
    
    // 음악 데이터를 다루기 위함 빈배열로 시작
    var musicArrays: [Music] = []
    
    // 컬렉션뷰의 레이아웃을 담당하는 객체
    let flowLayout = UICollectionViewFlowLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    // 컬렉션뷰 레이아웃 조정
    func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        
        flowLayout.scrollDirection = .vertical
        
        let collectionCellWidth = (UIScreen.main.bounds.width - 3 * (3 - 1)) / 3
        
        flowLayout.itemSize = CGSize(width: collectionCellWidth, height: collectionCellWidth)
        // 아이템 사이 간격 설정
        flowLayout.minimumInteritemSpacing = 1
        // 아이템 위아래 사이 간격 설정
        flowLayout.minimumLineSpacing = 1
        
        // 컬렉션뷰의 속성에 할당
        collectionView.collectionViewLayout = flowLayout
    }
    
    // 데이터 셋업
    func setupData() {
        guard let term = searchTerm else { return }
        print("네트워킹 시작 단어 \(term)")
        
        // (네트워킹 시작전 ) 빈배열로 만들기
        self.musicArrays = []
        
        networkManager.fetMusic(searchTerm: term) { result in
            if let result = result {
                self.musicArrays = result
            }
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
}
extension SearchResultCollectionViewController : UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return musicArrays.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MusicCollectionViewCell", for: indexPath) as! MusicCollectionViewCell
        cell.imageUrl = musicArrays[indexPath.item].imageUrl
        return cell
    }
}
