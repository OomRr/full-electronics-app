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
        
        OnBoardingPage(title: "We Provide The Best Electronic Products", description: "You will be able to find a wide selection of electronics"),
        
        OnBoardingPage(title: "Fast & Secure Delivery", description: "Get your products delivered to your door quickly and safely"),
        
        OnBoardingPage(title: "Easy Payment", description: "Multiple payment options available for your convenience"),
    ]
    
//MARK: - methods
    
    func page(at index: Int) -> OnBoardingPage {
        return pages[index]
    }
}
