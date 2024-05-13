//
//  WeatherData.swift
//  AlatbyWemaTest
//
//  Created by Computer on 5/10/24.
//

import Foundation

struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
    let humidity: Int
}

struct Weather: Codable {
    let description: String
}
