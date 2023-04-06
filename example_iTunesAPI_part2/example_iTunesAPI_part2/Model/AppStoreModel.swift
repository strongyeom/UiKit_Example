//
//  AppStoreModel.swift
//  example_iTunesAPI_part2
//
//  Created by 염성필 on 2023/04/01.
//

import Foundation

// MARK: - TodosResponse
struct AppStoreModel: Codable {
    let resultCount: Int?
    let results: [ITunes]?
}

// MARK: - Result
struct ITunes: Codable {
    // 앱 아이콘 60x60
    let artworkUrl60: String?
    // 앱 아이콘 100x100
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
    let contentAdvisoryRating: String?
    // 앱 이름
    let trackCensoredName: String?
    // 언어 설정
    let languageCodesISO2A: [String]?
    // 카카오톡 공식 홈페이지
    let sellerURL: String?
    // 구매 금액
    let formattedPrice: FormattedPrice?
    // 사용 가능 연령
    let trackContentRating: String?
    // 앱 설명
    let description: String?
    // 앱 개발 회사
    let sellerName: String?
    // 앱 이름
    let trackName: String?
    // 개발자 이름
    let artistName: String?
    // 앱 금액
    let price: Int?
    // 앱 과정 소개
    let releaseNotes: String?
    // 앱 카테고리
    let primaryGenreName: String?
    
    // 별점 Doubel -> String으로 변환 -> 별 찍기
    var averageRating: String? {
        
        let a1 = Int(averageUserRating!)
        var a2 = ""
        for _ in 0..<a1 {
            a2 += "★"
        }
        
        return a2
    }
    
    // 별점 평균 소수점 한자리수에서 끊기
    var averageRatingCount: String? {
        return String(Double(String(format: "%.1f", averageUserRating!))!)
    }
    
    // 사용가능 언어 갯수
    var languageCount: String? {
        return "+ \(languageCodesISO2A!.count-1)개 언어"
    }
    
    // 카테고리 별 케이스
    var categoryToString: String? {
        
        switch primaryGenreName {
        case "Social Networking":
            return "#4"
        case "Travel", "Games", "Utilities", "Education", "Entertainment","Reference", "Photo & Video", "Health & Fitness","Productivity","Lifestyle", "Medical", "Business", "Developer Tools", "Graphics & Design", "Music", "News", "Weather":
            return "#1"
        case "Navigation":
            return "#3"
        case "Sports":
            return "#2"
        case "Finance":
            return "#5"
        default:
            break
        }
        return ""
    }

    enum CodingKeys: String, CodingKey {
        case artworkUrl60, artworkUrl100
        case isGameCenterEnabled, screenshotUrls, artworkUrl512, supportedDevices
        case trackViewURL = "trackViewUrl"
        case averageUserRating, contentAdvisoryRating, trackCensoredName, languageCodesISO2A
        case sellerURL = "sellerUrl"
        case formattedPrice, trackContentRating, description
        case sellerName, primaryGenreName
        case trackName
        case artistName
        case price
        case releaseNotes
    }
}

//enum Rating: String, Codable {
//    case the12 = "12+"
//    case the17 = "17+"
//    case the4 = "4+"
//    case the9 = "9+"
//}

enum FormattedPrice: String, Codable {
    case free = "Free"
}

