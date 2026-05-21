//
//  CartViewModelType.swift
//  Full elcetronics store
//
//  Created by Omar on 18/05/2026.
//

import Foundation

protocol CartViewModelInput{
    func getCartData(userId: Int)
}
protocol CartViewModelOutput{
    var onStateChange: ((CartiewState) -> Void)? { get set }
    var CartEntity: CartEntity? {get set}

}

enum CartiewState {
    case loadingState
    case successState
    case failureState(Error)
}

typealias CartViewModelType =  CartViewModelInput & CartViewModelOutput
