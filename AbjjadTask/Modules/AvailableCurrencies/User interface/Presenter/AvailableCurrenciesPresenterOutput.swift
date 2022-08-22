//
//  AvailableCurrenciesPresenterOutput.swift
//  AbjjadTask
//
//
//  Created by ahmed gado on 19/08/2022.
//  
//

import UIKit

enum AvailableCurrenciesViewCategory {}

protocol AvailableCurrenciesPresenterOutput: AnyObject {
    func showLoading()
    func hideLoading()
    func reloadData()
    func display(_ title: String , _ cornerRadius: CGFloat)
}
