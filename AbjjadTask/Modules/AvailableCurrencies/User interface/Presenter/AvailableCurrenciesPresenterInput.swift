//
//  AvailableCurrenciesPresenterInput.swift
//  AbjjadTask
//
//
//  Created by ahmed gado on 19/08/2022.
//  
//

import UIKit

protocol AvailableCurrenciesPresenterInput {
    func viewDidLoad()
    func numberOfSections() -> Int
    func numberOfRows(at section: Int) -> Int
    func viewItem(at indexPath: IndexPath) -> AvailableCurrenciesViewItemProtocol?
    func selectItem(at indexPath: IndexPath)
}

// MARK: - AvailableCurrenciesViewItemProtocol

public protocol AvailableCurrenciesViewItemProtocol {
  var name: NSAttributedString { get }
}
