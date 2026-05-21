//
//  CartUseCase2.swift
//  Full elcetronics store
//
//  Created by Omar on 19/05/2026.
//

import Foundation
class CartUseCase2 {
    private let repo2: CartRepoProtocol2
    
    init(repo2: CartRepoProtocol2 = CartRepo2()) {
        self.repo2 = repo2
    }
    
    func getCartItems() -> [CartEntity]{
        repo2.getCartItems()
    }
    func addToCart(product: CartEntity){
        repo2.addToCart(product: product)
    }
    func removeFromCart(productId: Int){
        repo2.removeFromCart(productId: productId)
    }
    func updateQuantity(productId: Int, quantity: Int){
        repo2.updateQuantity(productId: productId, quantity: quantity)
    }
    func clearCart() {
        repo2.clearCart()
    }
}
