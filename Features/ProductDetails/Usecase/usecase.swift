//
//  usecase.swift
//  Full elcetronics store
//
//  Created by Omar on 18/05/2026.
//

import Foundation
protocol ProductDetailsUseCaseProtocol{
    func execute(id: Int, completion: @escaping (Result<ElectronicsModelElement,Error>) -> Void)
}

class ProductDetailsUsecase: ProductDetailsUseCaseProtocol{
    
    let ProductDetailsRepository: ProductDetailsRepoProtocol
    
    init(ProductDetailsRepository: ProductDetailsRepoProtocol) {
        self.ProductDetailsRepository = ProductDetailsRepository
    }
    
    func execute(id: Int, completion: @escaping (Result<ElectronicsModelElement, any Error>) -> Void) {
        ProductDetailsRepository.getPDData(id: id) { result in
            switch result {
                case .success(let electronics):
                completion(.success(electronics))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
   
}
