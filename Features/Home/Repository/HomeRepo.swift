//
//  HomeRepo.swift
//  Full elcetronics store
//
//  Created by Omar on 17/05/2026.
//

import Foundation
import Alamofire
import NDS_Networking

public protocol HomeRepoProtocol {
    func getHomeData(_ completion: @escaping (Result<ElectronicsModel, Error>) -> Void)
}

public class HomeRepo: Remote, HomeRepoProtocol {
    
    nonisolated public override init(network: Network) {
        super.init(network: network)
    }
   // let language = Defaults.sharedInstance.language ?? "en"
   // let token = Defaults.sharedInstance.userData?.token
    
    public func getHomeData(_ completion: @escaping (Result<ElectronicsModel, Error>) -> Void) {
        
        
        
        let path = "/categories/2/products"
        
        let parameters: Parameters = [
            "store_code": "ar",
//            "customer_token": token,
//            "quoteId": Defaults.sharedInstance.quoteId
        ]
        
        let request = NDSApiRequest(method: .get, path: path, parameters: parameters)
        enqueue(request, completion: completion)
    }
}
