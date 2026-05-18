//
//  ViewModelType.swift
//  Full elcetronics store
//
//  Created by Omar on 17/05/2026.
//

import Foundation
protocol ProductDetailsViewModelInput{
    
    func getPorductData(id: Int)
}
protocol ProductDetailsViewModelOutput{
    
    var onStateChange: ((PDViewState) -> Void)? { get set }
    var PDModel: ElectronicsModelElement? {get set}

}
enum PDViewState {
    case loadingState
    case successState
    case failureState(Error)
}
 
typealias ProductDetailsViewModelType = ProductDetailsViewModelInput & ProductDetailsViewModelOutput
