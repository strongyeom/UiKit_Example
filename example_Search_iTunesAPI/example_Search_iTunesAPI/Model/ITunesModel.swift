//
//  SearchResult.swift
//  example_Search_iTunesAPI
//
//  Created by 염성필 on 2023/03/31.
//

import Foundation

// MARK: - TodosResponse
struct ITunesData: Codable {
    let resultCount: Int?
    let results: [ITunes]?
}

// MARK: - Result
struct ITunes: Codable {
    // 앱 아이콘
    let artworkUrl100: String?
    // 게임이 가능한가?
    let isGameCenterEnabled: Bool?
    // 스샷
    let screenshotUrls: [String]?
    // 앱을 눌렀을때 보이는 아이콘
    let artworkUrl512: String?
    // 제공 가능한 디바이스들
    let supportedDevices: [String]?
    // 애플 스토어 주소
    let trackViewURL: String?
    // 평균 별점
    let averageUserRating: Double?
    // 사용 가능 연령
    let contentAdvisoryRating: Rating?
    // 앱 이름
    let trackCensoredName: String?
    // 언어 설정
    let languageCodesISO2A: [String]?
    // 카카오톡 공식 홈페이지
    let sellerURL: String?
    // 구매 금액
    let formattedPrice: FormattedPrice?
    // 사용 가능 연령
    let trackContentRating: Rating?
    // 언제 만들어졌는지?
   // let releaseDate: String?
    // 앱 설명
    let description: String?
    // 앱 개발 회사
    let sellerName: String?
    // 최근 업데이트 한 날짜
   // let currentVersionReleaseDate: Date?
    // 앱 이름
    let trackName: String?
    // 앱 만든 회사 이름
    let artistName: String?
    // 앱 금액
    let price: Int?
    
    let releaseNotes: String?
    
    // 별점 Doubel -> String으로 변환 -> 별 찍기
    var averageRating: String? {
        
        let a1 = Int(averageUserRating!)
        var a2 = ""
        for _ in 0..<a1 {
            a2 += "★"
        }
        
        return a2
    }

    enum CodingKeys: String, CodingKey {
        case  artworkUrl100
        case isGameCenterEnabled, screenshotUrls, artworkUrl512, supportedDevices
        case trackViewURL = "trackViewUrl"
        case averageUserRating, contentAdvisoryRating, trackCensoredName, languageCodesISO2A
        case sellerURL = "sellerUrl"
        case formattedPrice, trackContentRating, description
        //case releaseDate
        case sellerName
       // case currentVersionReleaseDate
        case trackName
        case artistName
        case price
        case releaseNotes
    }
}

enum Rating: String, Codable {
    case the12 = "12+"
    case the17 = "17+"
    case the4 = "4+"
    case the9 = "9+"
}

enum FormattedPrice: String, Codable {
    case free = "Free"
}

