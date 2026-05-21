//
//  LocalizationManager.swift
//  Full elcetronics store
//
//  Created by Omar on 20/05/2026.
//


import UIKit

class LocalizationManager {
    static let shared = LocalizationManager()
    private init() {}
    
    private let langKey = "AppLanguage"
    
    var currentLanguage: String {
        return UserDefaults.standard.string(forKey: langKey) ?? "en"
    }
    
    func setLanguage(_ lang: String) {
        UserDefaults.standard.set(lang, forKey: langKey)
        UserDefaults.standard.set([lang], forKey: "AppleLanguages")
        UserDefaults.standard.synchronize()
        
        // changing direction
        let direction: UISemanticContentAttribute = lang == "ar" ? .forceRightToLeft : .forceLeftToRight
        UIView.appearance().semanticContentAttribute = direction
        UINavigationBar.appearance().semanticContentAttribute = direction
        
        restartApp()
    }
    
    private func restartApp() {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first else { return }
        let VC = TabBarViewController()
        let NC = UINavigationController(rootViewController: VC)
        window.rootViewController = NC
       
        let rootVC = NC
        
        UIView.transition(with: window, duration: 0.4, options: .transitionFlipFromLeft) {
            window.rootViewController = rootVC
        }
    }
}
