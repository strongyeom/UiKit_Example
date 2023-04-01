//
//  NetworkManager.swift
//  example_Search_iTunesAPI
//
//  Created by 염성필 on 2023/03/31.
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    var iTunesUrl = "https://itunes.apple.com/search?entity=software"
    
    func fetchiTunes(term: String, completion: @escaping ([ITunes]?) -> Void) {
        let urlString = "\(iTunesUrl)&term=\(term)"
        print(urlString)
        
        performRequest(with: urlString) { result in
            completion(result)
        }
        
    }
    
    
    func performRequest(with urlString: String, completion: @escaping ([ITunes]?) -> Void) {
        
        // URL 구조체 만들기
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
            
            if let iTunes = self.parseJSON(safeData) {
                print("Parse 실행")
                completion(iTunes)
            } else {
                print("Parse 실패")
                completion(nil)
            }
        }
        .resume()
    }
    
    func parseJSON(_ iTunesData: Data) -> [ITunes]? {
        do {
            let iTunesData = try JSONDecoder().decode(ITunesData.self, from: iTunesData)
            return iTunesData.results
        } catch {
            print(String(describing: error))
            return nil
        }
    }

}

