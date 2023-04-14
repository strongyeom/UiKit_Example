//
//  NetworkManager.swift
//  example_iTunesAPI_part2_codebase
//
//  Created by 염성필 on 2023/04/14.
//

import Foundation

// final : 상속을 하지 않게 하기 위해 설정
final class NetworkManager {
    // 최초 만들때 전역변수로 두고(데이터 영역) instance만 접근 가능하게 하자 -> 한 instance에 어디 클래에서든 접근 가능
    static let shared = NetworkManager()
    // 여러 객체를 추가적으로 생성하지 못하도록 설정
    private init () { }
    
    // 가져오려는 고정 URL주소
    let iTunesURL = "https://itunes.apple.com/search?entity=software"
    
    // 네트워킹 요청하는 함수 ( iTunes 데이터 가져오기 )
    func fetchRequest(searchTerm: String, completion: @escaping ([ITunes]?) -> Void) {
        let urlString = "\(iTunesURL)&term=\(searchTerm)"
        print("iTunesURL주소",urlString)
        
        // urlString ==> performRequest 파라미터로 전달 ==> pasring ==> 나온 결과 실행 completion(결과)
        performRequest(with: urlString) { result in
            completion(result)
        }
    }
    
    
    // 실제 Request하는 함수 ( 비동기적 실행 ==> 클로저 방식으로 끝난 시점을 전달 받도록 설계 )
    // private : 이 클래스 안에서만 사용할 수 있도록 설정
    private func performRequest(with urlString: String, completion: @escaping ([ITunes]?) -> Void) {
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if error != nil {
                print("에러 발생했습니다.")
                completion(nil)
                return
            }
            
            guard let safeData = data else {
                print("데이터를 받을 수 없습니다.")
                completion(nil)
                return
            }
            
            if let iTunesdata = self.parseJSON(safeData) {
                print("parse 성공")
                completion(iTunesdata)
            } else {
                print("parse 실패")
                completion(nil)
            }
            
            
        }
        .resume()
    }
    
    
    // 받아온 데이터 분석하는 함수 ( 동기적 실행 )
    private func parseJSON(_ iTunesData: Data) -> [ITunes]? {
        // 우리가 만들어 놓은 구조체로 변환하는 객체와 메서드
        // JSON 데이터 ==> iTunesAPI구조체
        let iTunesData = try? JSONDecoder().decode(iTunesAPI.self, from: iTunesData)
        return iTunesData?.results
    }
    
    
}
