import UIKit


// MARK: - TodosResponse
struct MusicData: Codable {
    let numberOfCount: Int
    let results: [Music]
    
}

// MARK: - Result
struct Music: Codable {
    let artistName, collectionName, songName: String?
    let previewURL: String?
    let imageUrl: String?
    let releaseDate: Date?
    
    // 해당 프로퍼티 이름을 바꾸려면 CodingKeys를 사용하는데 구조체 안에 있는 것들 모두 적어줘야함
    enum CodingKeys: String, CodingKey {
        case artistName, collectionName
        case songName = "trackName"
        case previewURL = "previewUrl"
        case imageUrl = "artworkUrl100"
        case releaseDate
    }
}

// 함수를 실행하고 결과를 받고 싶으면 (completionHandler: @escaping ([Music]?) -> Void) 파라미터로 추가해야함
func getMethod(completionHandler: @escaping ([Music]?) -> Void) {

    // URL구조체 만들기
    guard let url = URL(string: "https://itunes.apple.com/search?term=jazz&media=music") else {
        print("Error: cannot create URL")
        completionHandler(nil)
        return
    }
    
    // URL요청 생성
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    
    
    // 요청을 가지고 작업세션시작
    // 비동기적으로 되어있어서 오래 걸림...
    URLSession.shared.dataTask(with: request) { data, response, error in
        // 에러가 없어야 넘어감
        guard error == nil else {
            print("Error: error calling GET")
            completionHandler(nil)
            return
        }
        // 옵셔널 바인딩
        guard let safeData = data else {
            print("Error: Did not receive data")
            return
        }
        // HTTP 200번대 정상코드인 경우만 다음 코드로 넘어감
        guard let response = response as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else {
            print("Error: HTTP request failed")
            completionHandler(nil)
            return
        }

        // 원하는 모델이 있다면, JSONDecoder로 decode코드로 구현 ⭐️
        print(String(decoding: safeData, as: UTF8.self))

      
        do {
            let decoder = JSONDecoder()
            let musicData = try decoder.decode(MusicData.self, from: safeData)
            completionHandler(musicData.results)
            return
        } catch {
            
        }
    }.resume()     // 시작
}

getMethod { music in
    guard let music = music else { return }
    dump(music)
}

