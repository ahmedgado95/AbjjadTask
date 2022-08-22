//
//  ChartInteractorDataSourceProtocol.swift
//  AbjjadTask
//
//
//  Created by ahmed gado on 19/08/2022.
//  
//

import Foundation

protocol ChartInteractorDataSourceItemProtocol {
  var identifier: String { get }
}

protocol ChartInteractorDataSourceProtocol {
    var chart: [[ChartModel]] { get set}
    var urlText: String { get set}
}
