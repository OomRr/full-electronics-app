//
//  HomeViewModel.swift
//  Full elcetronics store
//
//  Created by Omar on 17/05/2026.
//

import Foundation
class HomeViewModel: HomeViewModelType {
    var homeModel: ElectronicsModel?
    
    var onStateChange: ((ViewState) -> Void)?
    let homeUseCase: HomeUseCaseProtocol
    
    init(homeUseCase: HomeUseCaseProtocol) {
        self.homeUseCase = homeUseCase
    }
    
    
    func getHomeData() {
        self.onStateChange?(.loadingState)
        homeUseCase.execute {[weak self] result in
            switch result {
              
            case .success(let ElectronicsModel):
                self?.homeModel = ElectronicsModel
                self?.onStateChange?(.successState)
            case .failure(let error):
                self?.onStateChange?(.failureState(error))
            }
        }
    }
    
    
    
    
}
