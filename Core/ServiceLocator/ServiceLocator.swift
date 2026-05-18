//
//  ServiceLocator.swift
//  Full elcetronics store
//
//  Created by Omar on 17/05/2026.
//

import Foundation
class ServiceLocator{
    static let shared = ServiceLocator()
    private init(){}
    
    private var factories: [String: () -> Any] = [:]
    private var caches: [String: Any] = [:]
    
    func registerLazy<T>(service: @escaping () -> T ){
        let key = String(describing: T.self)
        factories[key] = service
    }
    
    
    
    func callService<T>() -> T {
        let key = String(describing: T.self)
        if let service = caches[key] {
            return service as! T
        }
        
        guard let service = factories[key] else {
            fatalError("The object is not registed please register it firt then try again")
        }
        
        //نفذ ال closure
        let fac = service()
        caches[key] = fac
        print("Done Lazy Init for: \(key) ")
        return fac as! T
    }
}
