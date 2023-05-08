//
//  TodayItem.swift
//  example_appStoreClone_code
//
//  Created by 염성필 on 2023/05/07.
//

import Foundation

/// 섹션에 따른 item들을 보여줌
struct TodayItem {
    var type: TodayItemType
    var items: [Any]
    var subText: String?
    var mainText: String?
}

enum TodayItemType: Int {
    case accountProfile
    case largeItem
    case smallItem
}
