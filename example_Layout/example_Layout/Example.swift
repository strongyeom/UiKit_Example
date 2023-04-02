//
//  Example.swift
//  example_Layout
//
//  Created by 염성필 on 2023/04/02.
//

import Foundation
import UIKit

struct Example {
    var mainTitle: String
    var subTitle: String
    var reivewTitle: String
    var imageTitle: UIImage
    var screenShot: UIImage
    
    init(mainTitle: String, subTitle: String, reivewTitle: String, imageTitle: UIImage, screenShot: UIImage) {
        self.mainTitle = mainTitle
        self.subTitle = subTitle
        self.reivewTitle = reivewTitle
        self.imageTitle = imageTitle
        self.screenShot = screenShot
    }
}
