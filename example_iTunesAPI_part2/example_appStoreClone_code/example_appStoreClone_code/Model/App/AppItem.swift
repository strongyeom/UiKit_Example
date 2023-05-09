//
//  AppItem.swift
//  example_appStoreClone_code
//
//  Created by 염성필 on 2023/05/09.
//

import Foundation

struct AppItem {
    var type: AppItemType
    var items: [Any]
    var subText: String?
    var mainText: String?
    var mainInfoText: String?
    var isAllShowButton: Bool?
}

enum AppItemType: Int {
    case largeItem
    case smallItem
}
