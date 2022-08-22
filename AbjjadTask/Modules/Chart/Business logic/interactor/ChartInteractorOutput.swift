//
//  ChartInteractorOutput.swift
//  AbjjadTask
//
//
//  Created by ahmed gado on 19/08/2022.
//  
//

import Foundation

public protocol ChartInteractorOutput: AnyObject {
    func setDefaultValues()
    func notifyLoading()
    func notifyNoDataError()
    func notifyNetworkError()
    func notifyServerError()
    func notifyChartData( _ chart: Chart)
    func setTitleName(_ title: String)
}
