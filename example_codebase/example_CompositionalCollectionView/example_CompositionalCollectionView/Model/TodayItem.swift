//
//  TodayItem.swift
//  example_CompositionalCollectionView
//
//  Created by 염성필 on 2023/04/15.
//

import Foundation

struct TodayItem {
    var type: TodayItemType
    var items: [Any]
    var subText: String?
    var mainText: String?
}

enum TodayItemType {
    case accountProfile
    case largeItem
    case smallItem
}
