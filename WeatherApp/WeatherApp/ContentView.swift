//
//  ContentView.swift
//  WeatherApp
//
//  Created by 황규상 on 6/25/24.
//

import SwiftUI
import CoreLocation

struct ContentView: View {
    @StateObject private var viewModel = WeatherViewModel()
    
    var body: some View {
        VStack {
            if let weather = viewModel.weather {
                Text("Temperature: \(weather.temperature)°C")
                Text("Description: \(weather.description)")
                Text("Humidity: \(weather.humidity)%")
                Text("Wind Speed: \(weather.windSpeed) m/s")
            } else if viewModel.isLoading {
                ProgressView("Loading...")
            } else {
                Text("Enter location to get weather information.")
            }
            
            TextField("Enter location", text: $viewModel.locationText)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Fetch Weather") {
                viewModel.fetchWeather()
            }
            .padding()
        }
        .padding()
    }
}


#Preview {
    ContentView()
}
