//  objs.swift
//  Full elcetronics store
//
//  Created by Omar on 18/05/2026.
//

import Foundation
import NDS_Networking
public class ObjsHome{
    
   static let shared = ObjsHome()
    
    
    let repo: HomeRepoProtocol
    let usecase: HomeUseCaseProtocol
    let viewMode: HomeViewModelType
    let HomeVIewController: HomeVC
    
    private init (){
        self.repo = HomeRepo(network: AlamofireNetwork())
        self.usecase = HomeUseCase(homeRepo: self.repo)
        self.viewMode = HomeViewModel(homeUseCase: self.usecase)
        self.HomeVIewController = HomeVC(viewModel: self.viewMode)
    }
    
}
public class ObjsProductDetails{
   static let shared = ObjsProductDetails()
    
    let repo: ProductDetailsRepoProtocol
    let usecase: ProductDetailsUseCaseProtocol
    let viewMode: ProductDetailsViewModelType
    
    private init (){
        self.repo = ProductDetailsReop(network: AlamofireNetwork())
        self.usecase = ProductDetailsUsecase(ProductDetailsRepository: self.repo)
        self.viewMode = ProductDetailsViewModel(PDUseCase: self.usecase)
    }


}
public class ObjsFav{
    static let shared = ObjsFav()
    
    let repo: FavoriteRepoProtocol
    let usecase: FavoriteUseCaseProtocol
    let viewMode: FavoriteViewModel
    
   private init(){
        self.repo = FavoriteRepo()
        self.usecase = FavoriteUseCase(repo: self.repo)
        self.viewMode = FavoriteViewModel()
    }

    
}
public class ObjsCart{
    static let shared = ObjsCart()
    
    let repo: CartRepoProtocol2
    let usecase: CartUseCase2
    let viewMode: CartViewModelType
    
    private init(){
        self.repo = CartRepo2()
        self.usecase = CartUseCase2(repo2:self.repo)
        self.viewMode = CartViewModel2()
    }
}
