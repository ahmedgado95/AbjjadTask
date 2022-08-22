//
//  AvailableCurrenciesInteractorModuleFactoryProtocol.swift
//  AbjjadTask
//
//
//  Created by ahmed gado on 19/08/2022.
//  
//

import Foundation

public protocol AvailableCurrenciesInteractorModuleFactoryProtocol {
  var output: AvailableCurrenciesInteractorOutput? { get set }
  func makeResponse(from request: AvailableCurrenciesInteractorModuleFactoryRequestProtocol) -> AvailableCurrenciesInteractorModuleFactoryResponseProtocol
}

public protocol AvailableCurrenciesInteractorModuleFactoryRequestProtocol {
}

public protocol AvailableCurrenciesInteractorModuleFactoryResponseProtocol {
  var interactor: AvailableCurrenciesInteractorInput { get }
}
