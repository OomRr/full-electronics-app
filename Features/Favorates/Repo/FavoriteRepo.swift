//
//  FavoriteRepo.swift
//  Full elcetronics store
//
//  Created by Omar on 20/05/2026.
//

import CoreData

public protocol FavoriteRepoProtocol {
    func getFavorites() -> [FavoriteEntity]
    func addFavorite(product: FavoriteEntity)
    func removeFavorite(productId: Int)
    func isFavorite(productId: Int) -> Bool
}

public class FavoriteRepo: FavoriteRepoProtocol {
    
    private let context = CoreDataManager.shared.context
    
    public func getFavorites() -> [FavoriteEntity] {
        let request: NSFetchRequest<FavoriteItem> = FavoriteItem.fetchRequest()
        // بنرتب من الأحدث للأقدم
      //  request.sortDescriptors = [NSSortDescriptor(key: "dateAdded", ascending: false)]
        let items = (try? context.fetch(request)) ?? []
        return items.map { $0.toEntity() }
    }
    
    public func addFavorite(product: FavoriteEntity) {
        // منضيفش لو موجود بالفعل
        guard !isFavorite(productId: product.productId) else { return }
        let item = FavoriteItem(context: context)
        item.productId = Int32(product.productId)
        item.productName = product.productName
        item.productImage = product.productImage
        item.productPrice = product.price
        CoreDataManager.shared.save()
    }
    
    public func removeFavorite(productId: Int) {
        let request: NSFetchRequest<FavoriteItem> = FavoriteItem.fetchRequest()
        request.predicate = NSPredicate(format: "productId == %d", productId)
        if let item = try? context.fetch(request).first {
            context.delete(item)
            CoreDataManager.shared.save()
        }
    }
    
    public func isFavorite(productId: Int) -> Bool {
        let request: NSFetchRequest<FavoriteItem> = FavoriteItem.fetchRequest()
        request.predicate = NSPredicate(format: "productId == %d", productId)
        let count = (try? context.count(for: request)) ?? 0
        return count > 0
    }
}
