//
//  ImageCache.swift
//  example_CompositionalCollectionView
//
//  Created by 염성필 on 2023/04/15.
//

import UIKit

// 이미지 캐시
class ImageCache {
    static let shared = NSCache<NSString,UIImage>()
}
