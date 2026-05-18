//
//  objs.swift
//  Full elcetronics store
//
//  Created by Omar on 18/05/2026.
//

import Foundation
import NDS_Networking
public class objs{
   static let shared = objs()
   static let repo = HomeRepo(network: AlamofireNetwork())
   static let usecase = HomeUseCase(homeRepo: repo)
   static let viewMode = HomeViewModel(homeUseCase: usecase)
   static let HomeVIewController = HomeVC(viewModel: viewMode )
    
}
public class objsPD{
   static let shared = objsPD()
   static let repo = ProductDetailsReop(network: AlamofireNetwork())
    static let usecase = ProductDetailsUsecase(ProductDetailsRepository: repo)
   static let viewMode = ProductDetailsViewModel(PDUseCase: usecase)
 //  static let ProductDetailsViewController = ProductDetailsVC2(viewModel: viewMode )
    
}
