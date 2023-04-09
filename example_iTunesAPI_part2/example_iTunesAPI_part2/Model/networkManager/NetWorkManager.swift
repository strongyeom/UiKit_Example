//
//  NetWorkManager.swift
//  example_iTunesAPI_part2
//
//  Created by 염성필 on 2023/04/01.
//

import Foundation

final class NetworkManager {
    
    // 싱글톤
    static let shared = NetworkManager()
    
    private init() {}
    
    // url 주소
    let iTunesUrl = "https://itunes.apple.com/search?entity=software"
    
    func fetchRequest(term: String, completion: @escaping([ITunes]?) -> Void) {
        
        
        let urlString = "\(iTunesUrl)&term=\(term)"
        print(urlString)
        
        performRequest(with: urlString) { result in
            if let result = result {
                completion(result)
            }
        }
    }
    
    private func performRequest(with urlString: String, completion: @escaping ([ITunes]?) -> Void) {
        
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if error != nil {
                print("에러 발생했습니다.")
                completion(nil)
                return
            }
            
            guard let safeData = data else {
                print("데이터를 받을 수 없습니다.")
                return
            }
            
            // parse
            if let data = self.parseJSON(safeData) {
                print("parse 성공")
                completion(data)
            } else {
                print("parse 실패")
                completion(nil)
            }
        }
        .resume()
    }
    
    
    private func parseJSON(_ data: Data) -> [ITunes]? {
        
        let appStoreData = try? JSONDecoder().decode(AppStoreModel.self, from: data)
        return appStoreData?.results
    }
    
    
    
    
}
