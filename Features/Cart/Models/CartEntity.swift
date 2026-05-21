//
//  CartEntity.swift
//  Full elcetronics store
//
//  Created by Omar on 19/05/2026.
//

import Foundation

public struct CartEntity {
    public let productId: Int
    public let productName: String
    public let productImage: String
    public let price: Double
    public var quantity: Int
    
    public init(productId: Int, productName: String, productImage: String, price: Double, quantity: Int) {
        self.productId = productId
        self.productName = productName
        self.productImage = productImage
        self.price = price
        self.quantity = quantity
    }
}
