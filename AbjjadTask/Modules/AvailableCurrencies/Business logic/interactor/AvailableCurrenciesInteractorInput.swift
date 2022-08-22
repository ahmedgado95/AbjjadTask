//
//  AvailableCurrenciesInteractorInput.swift
//  AbjjadTask
//
//
//  Created by ahmed gado on 19/08/2022.
//  
//

import Foundation

public enum AvailableCurrenciesCategory {
}


public protocol AvailableCurrenciesInteractorInput {
    func retrieve()
    func numberOfCategories() -> Int
    func numberOfItems(for categoryIndex: Int) -> Int
    func item(atIndex index: Int, for categoryIndex: Int) -> AvailableCurrenciesItemProtocol?
    func selectItem(atIndex index: Int, for categoryIndex: Int)
}

// MARK: - AvailableCurrenciesItemProtocol

public protocol AvailableCurrenciesItemProtocol {
  var name: String { get }
}
