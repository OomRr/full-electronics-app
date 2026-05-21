//
//  String+Localization.swift
//  Full elcetronics store
//
//  Created by Omar on 20/05/2026.
//

import Foundation

extension String {
    var localized: String {
        let lang = LocalizationManager.shared.currentLanguage
        guard let path = Bundle.main.path(forResource: lang, ofType: "lproj"),
              let bundle = Bundle(path: path) else {
            return NSLocalizedString(self, comment: "")
        }
        return bundle.localizedString(forKey: self, value: nil, table: nil)
    }
}
