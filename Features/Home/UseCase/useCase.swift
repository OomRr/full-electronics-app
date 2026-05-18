//
//  useCase.swift
//  Full elcetronics store
//
//  Created by Omar on 17/05/2026.
//

import Foundation

protocol HomeUseCaseProtocol {
    
    
    func execute(complition: @escaping (Result<ElectronicsModel, Error>) -> Void)
}
class HomeUseCase: HomeUseCaseProtocol{
    
    
    let homeRepo: HomeRepoProtocol

    init(homeRepo: HomeRepoProtocol) {
        self.homeRepo = homeRepo
    }
    
    func execute(complition: @escaping (Result<ElectronicsModel, any Error>) -> Void) {
      
        homeRepo.getHomeData { result in
            switch result {
            case .success(let electronics):
                complition(.success(electronics))
            case .failure(let e):
                complition(.failure(e))
                
                
            }
        }
    }
}
