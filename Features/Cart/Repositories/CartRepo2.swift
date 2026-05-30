//
//  CartRepo2.swift
//  Full elcetronics store
//
//  Created by Omar on 19/05/2026.
//

import Foundation
import CoreData

public protocol CartRepoProtocol2 {
    func getCartItems() -> [CartEntity]
    func addToCart(product: CartEntity)
    func updateQuantity(productId: Int, quantity: Int)
    func removeFromCart(productId: Int)
    func clearCart()
}

public class CartRepo2: CartRepoProtocol2{
    
    private let context = CoreDataManager.shared.context
    
    //  Read 
    public func getCartItems() -> [CartEntity] {
        let request: NSFetchRequest<CartItem> = CartItem.fetchRequest()
        let items = (try? context.fetch(request)) ?? []
        return items.map { $0.toEntity() }
    }
    
    public func addToCart(product: CartEntity) {
        // لو المنتج موجود زود ال quantity بس
        let request: NSFetchRequest<CartItem> = CartItem.fetchRequest()
        request.predicate = NSPredicate(format: "productId == %d", product.productId)
        
        if let existing = try? context.fetch(request).first {
            existing.quantity += 1
        } else {
            let item = CartItem(context: context)
            item.id = UUID()
            item.productId = Int32(product.productId)
            item.productName = product.productName
            item.productImage = product.productImage
            item.price = product.price
            item.quantity = 1
        }
        CoreDataManager.shared.save()
    }
    
    public func updateQuantity(productId: Int, quantity: Int) {
        let request: NSFetchRequest<CartItem> = CartItem.fetchRequest()
        request.predicate = NSPredicate(format: "productId == %d", productId)
        
        if let item = try? context.fetch(request).first {
            item.quantity = Int32(quantity)
            CoreDataManager.shared.save()
        }
    }
    
    public func removeFromCart(productId: Int) {
        let request: NSFetchRequest<CartItem> = CartItem.fetchRequest()
        request.predicate = NSPredicate(format: "productId == %d", productId)
        
        if let item = try? context.fetch(request).first {
            context.delete(item)
            CoreDataManager.shared.save()
        }
    }
    
    public func clearCart() {
        let request: NSFetchRequest<NSFetchRequestResult> = CartItem.fetchRequest()
        let delete = NSBatchDeleteRequest(fetchRequest: request)
        try? context.execute(delete)
        CoreDataManager.shared.save()
    }
}
