//
//  RandomData.swift
//  example_appStoreClone_code
//
//  Created by 염성필 on 2023/05/08.
//

import UIKit

class RandomData {
    static var image: UIImage {
        guard let colorString = [
//            "black_skillist",
            "blue_skillist",
            "gray_skillist",
            "green_skillist",
            "orange_skillist",
            "pink_skillist",
            "purple_skillist"
            ].randomElement(),
              let image = UIImage(named: colorString) else {
                  return UIImage(named: "AppIcon")!
              }
        return image
    }
    
    static var boolean: Bool {
        let isPurchase = [
            true,
            false
        ].randomElement()
        return isPurchase ?? false
    }
}
