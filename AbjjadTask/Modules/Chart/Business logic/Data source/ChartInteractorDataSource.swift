//
//  ChartInteractorDataSource.swift
//  AbjjadTask
//
//
//  Created by ahmed gado on 19/08/2022.
//  
//

import Foundation

final class ChartInteractorDataSource: ChartInteractorDataSourceProtocol {
    var chart: [[ChartModel]] = []
    var urlText: String = "BTCUSDT"
}

public enum ChartModel: Codable {
    case integer(Int)
    case string(String)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(ChartModel.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for WelcomeElement"))
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .integer(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}

public typealias Chart = [[ChartModel]]

