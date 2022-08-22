//
//  ChartPresenterOutput.swift
//  AbjjadTask
//
//
//  Created by ahmed gado on 19/08/2022.
//  
//

import UIKit

enum ChartViewCategory {}

protocol ChartPresenterOutput: AnyObject {
    func showLoading()
    func hideLoading()
    func displayChart(_ chart: Chart)
    func displayTitle(_ title : String)

}
