//
//  ChartInteractorInput.swift
//  AbjjadTask
//
//
//  Created by ahmed gado on 19/08/2022.
//  
//

import Foundation

public enum ChartCategory {
}

public protocol ChartInteractorInput {
  func retrieve()
  func chartData()
  func textChange(_ index: Int)
}
