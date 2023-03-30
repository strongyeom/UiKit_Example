//
//  ViewController.swift
//  example_AppStoreMusic
//
//  Created by 염성필 on 2023/03/30.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var musicTableView: UITableView!
    
    var networkManager = NetworkManager.shared
    
    var musicArrays: [Music] = []
   // let searchController = UISearchController()
    
    let searchControl = UISearchController(searchResultsController: UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SearchResultCollectionViewController") as! SearchResultCollectionViewController)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setUpDatas()
        setupSearchBar()
    }
    
    func setupSearchBar() {
        self.title = "Music Search"
        navigationItem.searchController = searchControl
        
        // 서치바의 사용
        //searchController.searchBar.delegate = self
        searchControl.searchBar.autocapitalizationType = .none
        
        searchControl.searchResultsUpdater = self
    }
    
    func setupTableView() {
        print("ViewController - setupTableView called")
        musicTableView.dataSource = self
        musicTableView.delegate = self
        musicTableView.register(UINib(nibName: "MyMusicCell", bundle: nil), forCellReuseIdentifier: "MyMusicCell")
    }
    
    func setUpDatas() {
        networkManager.fetMusic(searchTerm: "jazz") { result in
            print("ViewController - setUpDatas called")
            print("데이터 제대로 받았음")
            if let result = result {
                self.musicArrays = result
            }
            
            DispatchQueue.main.async {
                //  테이블 뷰를 다시 그림 --> main에서 처리해야함
                self.musicTableView.reloadData()
            }
        }
    }
    
    

}


// MARK: UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.musicArrays.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyMusicCell", for: indexPath) as! MyMusicCell
        cell.imageUrl = musicArrays[indexPath.row].imageUrl
        cell.albumNameLabel.text = musicArrays[indexPath.row].albumName
        cell.artistNameLabel.text = musicArrays[indexPath.row].artistName
        cell.songNameLabel.text = musicArrays[indexPath.row].songName
        cell.releaseDataLabel.text = musicArrays[indexPath.row].releaseDateString
        
        cell.selectionStyle = .none
        return cell
    }
    
    
}


// MARK: UITableViewDelegate
extension ViewController: UITableViewDelegate {
    // 테이블 뷰 셀의 높이를 조절하는 메서드
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    // 유동적인 셀의 높이를 생각한다면 estimatedHeightForRowAt 에 UITableView.automaticDimension 사용하기
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
}

//extension ViewController : UISearchBarDelegate {
//    
////    // 글자가 입력될때마다 호출되는 메서드
////    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
////        print(searchText)
////
////        self.musicArrays = []
////
////        networkManager.fetMusic(searchTerm: searchText) { result in
////            if let result = result {
////                self.musicArrays = result
////            }
////            DispatchQueue.main.async {
////                self.musicTableView.reloadData()
////            }
////        }
////    }
//    
//    
//     //검색이 눌렸을때 호출되는 메서드
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        guard let text = searchController.searchBar.text else { return }
//
//        self.musicArrays = []
//
//        networkManager.fetMusic(searchTerm: text) { result in
//            if let result = result {
//                self.musicArrays = result
//            }
//            DispatchQueue.main.async {
//                self.musicTableView.reloadData()
//            }
//        }
//        self.view.endEditing(true)
//    }
//}

extension ViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        
        let vc = searchController.searchResultsController as! SearchResultCollectionViewController
        vc.searchTerm = searchController.searchBar.text ?? ""
    }
}
