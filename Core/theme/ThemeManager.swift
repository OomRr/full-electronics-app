//
//  ThemeManager.swift
//  Full elcetronics store
//
//  Created by Omar on 02/06/2026.
//

import Foundation
// ThemeManager.swift

import UIKit

class ThemeManager {
    static let shared = ThemeManager()
    private init() {}
    
    private let themeKey = "app_theme_is_dark"
    
    var isDarkMode: Bool {
        get { UserDefaults.standard.bool(forKey: themeKey) }
        set {
            UserDefaults.standard.set(newValue, forKey: themeKey)
            applyTheme()
        }
    }
    
    // Call this on every launch from SceneDelegate
    func applyOnLaunch(to window: UIWindow) {
        apply(to: window)
    }

    func apply(to window: UIWindow) {
        window.overrideUserInterfaceStyle = isDarkMode ? .dark : .light
    }
    
    private func applyTheme() {
   
        UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .forEach { apply(to: $0) }
    }
}
