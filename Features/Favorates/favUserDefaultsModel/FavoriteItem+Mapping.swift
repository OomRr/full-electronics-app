//
//  FavoriteItem+Mapping.swift
//  Full elcetronics store
//
//  Created by Omar on 20/05/2026.
//

import Foundation
extension FavoriteItem{
    func toEntity() -> FavoriteEntity {
        FavoriteEntity(productId: Int(productId), productName: productName ?? "", productImage: productImage ?? "", price: productPrice )
    }
}
