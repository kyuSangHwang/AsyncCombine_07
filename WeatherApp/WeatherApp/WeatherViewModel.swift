//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by 황규상 on 6/25/24.
//

import Foundation
import Combine
import CoreLocation

class WeatherViewModel: ObservableObject {
    @Published var weather: WeatherData?
    @Published var isLoading: Bool = false
    @Published var error: Error?
    @Published var locationText: String = ""

    private let weatherService = WeatherService()
    private var cancellables = Set<AnyCancellable>()

    func fetchWeather() {
        guard !locationText.isEmpty else {
            return
        }
        
        isLoading = true
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(locationText) { [weak self] placemarks, error in
            guard let self = self else { return }
            if let error = error {
                self.error = error
                self.isLoading = false
                return
            }
            if let location = placemarks?.first?.location {
                Task {
                    do {
                        let weather = try await self.weatherService.fetchWeather(for: location)
                        DispatchQueue.main.async {
                            self.weather = weather
                            self.isLoading = false
                        }
                    } catch {
                        DispatchQueue.main.async {
                            self.error = error
                            self.isLoading = false
                        }
                    }
                }
            }
        }
    }
}
