//
//  CartItem+Mapping.swift
//  Full elcetronics store
//
//  Created by Omar on 19/05/2026.
//

import Foundation
extension CartItem {
    func toEntity() -> CartEntity {
        CartEntity(
            productId: Int(productId),
            productName: productName ?? "",
            productImage: productImage ?? "",
            price: price,
            quantity: Int(quantity)
        )
    }
}
