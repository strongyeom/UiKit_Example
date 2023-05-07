//
//  ImageCache.swift
//  example_appStoreClone_code
//
//  Created by 염성필 on 2023/05/07.
//

import UIKit

// 이미지 캐시
class ImageCache {
    static let shared = NSCache<NSString, UIImage>()
}
