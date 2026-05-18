//
//  PDetailsRepo.swift
//  Full elcetronics store
//
//  Created by Omar on 18/05/2026.
//


import Foundation
import Alamofire
import NDS_Networking

public protocol ProductDetailsRepoProtocol {
   
    func getPDData(id: Int, _ completion: @escaping (Result<ElectronicsModelElement, Error>) -> Void)
}

public class ProductDetailsReop: Remote, ProductDetailsRepoProtocol {
   
    nonisolated public override init(network: Network) {
        super.init(network: network)
    }
    
    public func getPDData(id: Int, _ completion: @escaping (Result<ElectronicsModelElement, Error>) -> Void) {
        
        
        
        let path = "/products/\(id)"
        
        let parameters: Parameters = [
                        "id": "id",
        ]
        
        let request = NDSApiRequest(method: .get, path: path,)
        enqueue(request, completion: completion)
    }
}
