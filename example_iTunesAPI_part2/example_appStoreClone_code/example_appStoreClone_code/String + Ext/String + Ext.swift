//
//  File.swift
//  example_appStoreClone_code
//
//  Created by 염성필 on 2023/05/07.
//

import Foundation

extension String {
    // String 로컬라이즈
    var localized: String {
        return NSLocalizedString(self, tableName: "Localizable", value: self, comment: "")
    }
}
