//
//  ViewModel.swift
//  Full elcetronics store
//
//  Created by Omar on 20/05/2026.
//

import Foundation
class FavoriteViewModel {
    private let useCase = FavoriteUseCase()
    
    var favorites: [FavoriteEntity] = []
    
    func loadFavorites() {
        favorites = useCase.getFavorites()
    }
    
    func toggleFavorite(product: FavoriteEntity) {
        useCase.toggleFavorite(product: product)
        loadFavorites()
    }
    
    func isFavorite(productId: Int) -> Bool {
        useCase.isFavorite(productId: productId)
    }
    
    func removeFavorite(productId: Int) {
        useCase.removeFavorite(productId: productId)
        loadFavorites()
    }
    func addToFav(productId: Int) {
        useCase.removeFavorite(productId: productId)
        loadFavorites()
    }
}
