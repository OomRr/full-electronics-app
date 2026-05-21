//
//  FavoriteEntity.swift
//  Full elcetronics store
//
//  Created by Omar on 20/05/2026.
//

import Foundation
public struct FavoriteEntity {
    public let productId: Int
    public let productName: String
    public let productImage: String
    public let price: Double
    
    public init(productId: Int, productName: String, productImage: String, price: Double) {
        self.productId = productId
        self.productName = productName
        self.productImage = productImage
        self.price = price
    }
}
