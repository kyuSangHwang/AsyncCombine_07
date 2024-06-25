//
//  WeatherService.swift
//  WeatherApp
//
//  Created by 황규상 on 6/25/24.
//

import Foundation
import WeatherKit
import CoreLocation

class WeatherService {
    let weatherKit = WeatherKit.WeatherService()

    func fetchWeather(for location: CLLocation) async throws -> WeatherData {
        let weather = try await weatherKit.weather(for: location)
        
        return WeatherData(
            temperature: weather.currentWeather.temperature.value,
            description: weather.currentWeather.condition.description,
            humidity: weather.currentWeather.humidity,
            windSpeed: weather.currentWeather.wind.speed.value
        )
    }
}
