//
//  OnBoardingViewModel.swift
//  Full elcetronics store
//
//  Created by Omar on 13/05/2026.
//

import Foundation
class OnBoardingViewModel {
    
//MARK: - properties
    
    var currentPage = 0
    var isLastPage: Bool { currentPage == pages.count - 1}
    
//MARK: - DATA
    
    let pages: [OnBoardingPage] = [
        
        OnBoardingPage(title: "onboarding_title1".localized, description: "onboarding_desc1".localized),
        
        OnBoardingPage(title: "onboarding_title2".localized, description: "onboarding_desc2".localized),
        
        OnBoardingPage(title: "onboarding_title3".localized, description: "onboarding_desc3".localized),
    ]
    
//MARK: - methods
    
    func page(at index: Int) -> OnBoardingPage {
        return pages[index]
    }
}
