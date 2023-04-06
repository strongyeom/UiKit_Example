//
//  Ext+Localized.swift
//  example_iTunesAPI_part2
//
//  Created by 염성필 on 2023/04/06.
//

import Foundation

extension String {
    func localized(bundle: Bundle = .main, tableName: String = "Localizable") -> String {
        return NSLocalizedString(self, tableName: tableName, value: "**\(self)**", comment: "")
    }
}
