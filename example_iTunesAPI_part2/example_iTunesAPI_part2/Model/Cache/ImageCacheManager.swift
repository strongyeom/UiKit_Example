//
//  ImageCacheManager.swift
//  example_iTunesAPI_part2
//
//  Created by 염성필 on 2023/04/08.
//

import Foundation
import UIKit

class ImageCacheManager {
    static let shared = NSCache<NSString, UIImage>()
    
    private init() { }
    
}
