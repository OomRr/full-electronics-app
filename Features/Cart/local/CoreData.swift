//
//  CoreData.swift
//  Full elcetronics store
//
//  Created by Omar on 19/05/2026.
//


import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    
    private init() {}
    
    lazy var context: NSManagedObjectContext = {
        persistentContainer.viewContext
    }()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CartModel")
        container.loadPersistentStores { _, error in
            if let error { fatalError("Core Data error: \(error)") }
        }
        return container
    }()
    
    func save() {
        guard context.hasChanges else { return }
        try? context.save()
    }
}
