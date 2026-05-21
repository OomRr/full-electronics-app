//
//  SettingsVC.swift
//  Full elcetronics store
//
//  Created by Omar on 19/05/2026.
//

import UIKit

class SettingsVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func changeLanguage(_ sender: UIButton) {
        let current = LocalizationManager.shared.currentLanguage
        let newLang = current == "en" ? "ar" : "en"
        LocalizationManager.shared.setLanguage(newLang)
    }
}
