////
////  File.swift
////  Full elcetronics store
////
////  Created by Omar on 18/05/2026.
////
//
//import Foundation
//class CartViewModel: CartViewModelType {
//   
//    var onStateChange: ((CartiewState) -> Void)?
//    
//    var CartEntity: CartEntity?
//    
//    let getCartUsecase: GetCartUseCase
//    
//    init(getCartUsecase: GetCartUseCase) {
//
//        self.getCartUsecase = getCartUsecase
//    }
//    
//    func getCartData(userId: Int) {
//        getCartUsecase.execute(userId: userId) { result in
//            switch result {
//                case .success(let cart):
//                self.CartEntity = cart
//                self.onStateChange?(.successState)
//            case .failure(let error):
//                self.onStateChange?(.failureState(error))
//                print(error)
//            }
//        }
//    }
//}
