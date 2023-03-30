//
//  NetworkManager.swift
//  example_AppStoreMusic
//
//  Created by 염성필 on 2023/03/30.
//
import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()

    private init() {}
    
    var musicURL = "https://itunes.apple.com/search?"
    
    func fetMusic(searchTerm: String, completion: @escaping ([Music]?) -> Void) {
         let urlString = "\(musicURL)term=\(searchTerm)&media=music"
        print(urlString)
        performRequest(with: urlString) { result in
            completion(result)
        }
    }
    
    
    
    // 함수를 실행하고 결과를 받고 싶으면 (completionHandler: @escaping ([Music]?) -> Void) 파라미터로 추가해야함
    func performRequest(with urlString: String, completion: @escaping ([Music]?) -> Void) {

        // URL구조체 만들기
        guard let url = URL(string: urlString) else {
            print("Error: cannot create URL")
            completion(nil)
            return
        }
        
        // 요청을 가지고 작업세션시작
        // 비동기적으로 되어있어서 오래 걸림...
        URLSession.shared.dataTask(with: url) { data, response, error in
            // 에러가 없어야 넘어감
            guard error == nil else {
                print("Error: error calling GET")
                completion(nil)
                return
            }
            // 옵셔널 바인딩
            guard let safeData = data else {
                print("Error: Did not receive data")
                return
            }
          
            if let musics = self.parseJSON(safeData) {
                print("Parse실행")
                completion(musics)
            } else {
                print("Parse 실패")
                completion(nil)
            }
        }
        .resume()     // 시작
    }
    
    private func parseJSON(_ musicData: Data) -> [Music]? {
        do {
            let musicData = try JSONDecoder().decode(MusicData.self, from: musicData)
            return musicData.results
        } catch {
            print(String(describing: error))
            return nil
        }
        
    }
}
