//
//  SettingsVC.swift
//  Full elcetronics store
//
//  Created by Omar on 19/05/2026.
//

import UIKit

class SettingsVC: UIViewController {
    
    @IBOutlet weak var switchBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "settings".localized
        switchBtn.setTitle("switch_language".localized, for: .normal)
        
    }
    @IBAction func changeLanguage(_ sender: UIButton) {
        let current = LocalizationManager.shared.currentLanguage
        let newLang = current == "en" ? "ar" : "en"
        LocalizationManager.shared.setLanguage(newLang)
    }
}
