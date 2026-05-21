////
////  getCart.swift
////  Full elcetronics store
////
////  Created by Omar on 19/05/2026.
////
//
//import Foundation
//class GetCartUseCase {
//    private let repo: CartRepoProtocol
//    init(repository: CartRepoProtocol) {
//        self.repo = repository
//    }
//    func execute(userId: Int, _ completion: @escaping (Result<CartEntity, Error>) -> Void) {
//        repo.getCart(userId: userId) { res in
//            switch res {
//                case .success(let cart):
//                completion(.success(cart))
//            case .failure(let error):
//                completion(.failure(error))
//            }
//        }
//    }
//   
//    
//    
//    
//    
//}
