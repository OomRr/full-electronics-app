//
//  CartView2.swift
//  Full elcetronics store
//
//  Created by Omar on 19/05/2026.
//

import Foundation
class CartViewModel2: CartViewModelType {
    
    
    var onStateChange: ((CartiewState) -> Void)?
    
    var CartEntity: CartEntity?
    
    private let useCase2 = CartUseCase2()
    
    var cartItems: [CartEntity] = []
    
    var totalPrice: Double {
        cartItems.reduce(0) { $0 + ($1.price * Double($1.quantity)) }
    }
    
    func loadCart(){
        cartItems = useCase2.getCartItems()
    }
    func addToCart(product: CartEntity){
        useCase2.addToCart(product: product)
        loadCart()
    }
    func removeItem(productId: Int){
        useCase2.removeFromCart(productId: productId); loadCart()
    }
    func clearCart(){
        useCase2.clearCart(); loadCart()
    }
    
    func updateQuantity(productId: Int, quantity: Int) {
        quantity <= 0
        ? useCase2.removeFromCart(productId: productId)
        : useCase2.updateQuantity(productId: productId, quantity: quantity)
        loadCart()
    }
}
