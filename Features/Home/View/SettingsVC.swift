//
//  SettingsVC.swift
//  Full elcetronics store
//
//  Created by Omar on 19/05/2026.
//

import UIKit

class SettingsVC: UIViewController {
    
    @IBOutlet weak var switchBtn: UIButton!
    @IBOutlet weak var toggleSwitch: UISwitch!
    @IBOutlet weak var darkModeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "settings".localized
        switchBtn.setTitle("switch_language".localized, for: .normal)
        toggleSwitch.isOn = ThemeManager.shared.isDarkMode
        updateDarkModeButton()
    }
    @IBAction func changeLanguage(_ sender: UIButton) {
        let current = LocalizationManager.shared.currentLanguage
        let newLang = current == "en" ? "ar" : "en"
        LocalizationManager.shared.setLanguage(newLang)
    }
    
    private func updateDarkModeButton() {
        
        darkModeLabel.text = "dark_mode".localized
    }
    
    @IBAction func toggleTapped(_ sender: Any) {
       
        ThemeManager.shared.isDarkMode.toggle()
       
       
        
    }
}
