//
//  ViewModelType.swift
//  Full elcetronics store
//
//  Created by Omar on 17/05/2026.
//

import Foundation
protocol HomeViewModelInput{
    func getHomeData()
}
protocol HomeViewModelOutput{
    var onStateChange: ((ViewState) -> Void)? { get set }
    var homeModel: ElectronicsModel? {get set}

}
enum ViewState {
    case loadingState
    case successState
    case failureState(Error)
}
 
typealias HomeViewModelType = HomeViewModelInput & HomeViewModelOutput
