//
//  favUseCase.swift
//  Full elcetronics store
//
//  Created by Omar on 20/05/2026.
//

import Foundation
class FavoriteUseCase {
    private let repo: FavoriteRepoProtocol
    
    init(repo: FavoriteRepoProtocol = FavoriteRepo()) {
        self.repo = repo
    }
    
    func getFavorites() -> [FavoriteEntity]{
        repo.getFavorites()
    }
    func addFavorite(product: FavoriteEntity){ repo.addFavorite(product: product)
    }
    func removeFavorite(productId: Int){ repo.removeFavorite(productId: productId)
    }
    func isFavorite(productId: Int) -> Bool{ repo.isFavorite(productId: productId)
    }
    
    func toggleFavorite(product: FavoriteEntity){
        isFavorite(productId: product.productId)
        ? removeFavorite(productId: product.productId)
        : addFavorite(product: product)
    }
}
