//
//  AvailableCurrenciesInteractorDataSourceProtocol.swift
//  AbjjadTask
//
//
//  Created by ahmed gado on 19/08/2022.
//  
//

import Foundation

protocol AvailableCurrenciesInteractorDataSourceItemProtocol {
  var identifier: String { get }
}

protocol AvailableCurrenciesInteractorDataSourceProtocol {
    var availableCurrencies: [String] { get set}
}
