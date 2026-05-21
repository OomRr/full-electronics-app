//
//  HomeViewModel.swift
//  Full elcetronics store
//
//  Created by Omar on 17/05/2026.
//

import Foundation
class ProductDetailsViewModel: ProductDetailsViewModelType {
   

    
    var PDModel: ElectronicsModelElement?
    
    var onStateChange: ((PDViewState) -> Void)?
    
    let productDetailsUseCase: ProductDetailsUseCaseProtocol
    
    
    
    init(PDUseCase: ProductDetailsUseCaseProtocol) {
        self.productDetailsUseCase = PDUseCase
    }
    
    
    func getPorductData(id: Int) {
        self.onStateChange?(.loadingState)
        productDetailsUseCase.execute(id: id) {[weak self] result in
            switch result {
              
            case .success(let ElectronicsModelElements):
                self?.PDModel = ElectronicsModelElements
                self?.onStateChange?(.successState)
            case .failure(let error):
                self?.onStateChange?(.failureState(error))
            }
        }
    }
}
