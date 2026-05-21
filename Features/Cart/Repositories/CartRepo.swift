////
////  CartRepo.swift
////  Full elcetronics store
////
////  Created by Omar on 19/05/2026.
////
//
//
//
//import Alamofire
//import NDS_Networking
//
//public protocol CartRepoProtocol {
//    func getCart(userId: Int, _ completion: @escaping (Result<CartEntity, Error>) -> Void)
//    func addToCart(userId: Int, productId: Int, quantity: Int, _ completion: @escaping (Result<CartEntity, Error>) -> Void)
//}
//
//public class CartRepo: Remote, CartRepoProtocol {
//    
//    
//    nonisolated public override init(network: Network) {
//        super.init(network: network)
//    }
//    
//    public func getCart(userId: Int, _ completion: @escaping (Result<CartEntity, Error>) -> Void) {
//        let path = "/carts/\(userId)"
//        let request = NDSApiRequest(method: .get, path: path, parameters: nil)
//        enqueue(request, completion: completion)
//    }
//    
//    public func addToCart(userId: Int, productId: Int, quantity: Int, _ completion: @escaping (Result<CartEntity, Error>) -> Void) {
//        let path = "/carts"
//        
//        let parameters: Parameters = [
//            "userId": userId,
//            "products": [
//                ["productId": productId, "quantity": quantity]
//            ]
//        ]
//        
//        let request = CartRequest(method: .post, path: path, parameters: parameters)
//        enqueue(request, completion: completion)
//    }
//}
