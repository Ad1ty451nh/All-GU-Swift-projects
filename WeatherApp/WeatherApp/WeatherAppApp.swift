//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by admin on 17/03/26.
//

import SwiftUI

struct WeatherResponse: Codable{
    let current_weather: CurrentWeather
}

struct CurrentWeather: Codable{
    let temperature: Double
    let windspeed: Double
    let weathercode: Int
}

class WeatherViewModel: ObservableObject{
    @Published var city: String = ""
    @Published var temperature: String = "--"
    @Published var windspeed: String = "--"
    @Published var condition: String = "--"
    
    @Published var isLoading: Bool = false
    @Published var errorMessage: String = ""
    
    func fetchWeather() {
        errorMessage = ""
        
        guard !city.isEmpty else {
            errorMessage = "Enter a city name"
            return
        }
        
        let coordinates = getCoordinates(for: city)
        
        guard let lat = coordinates?.lat,
              let lon = coordinates?.lon else {
            errorMessage = "City not found"
            return
        }
        let urlString = "https://api.open-meteo.com/v1/forecast?latitude=\(lat)&longitude=\(lon)&current_weather=true"
        
        guard let url = URL(string: urlString) else {
            errorMessage = "Invalid URL"
            return
        }
        
        isLoading = true
        
        Task{
            do{
                let (data, _) = try await URLSession.shared.data(from: url)
                
                let decoded = try JSONDecoder().decode(WeatherResponse.self, from:data)
                
                DispatchQueue.main.async{
                    self.temperature = "\(decoded.current_weather.temperature)°C"
                    self.windspeed = "\(decoded.current_weather.windspeed) km/h"
                    self.condition = self.getWeatherDescription(code: decoded.current_weather.weathercode)
                    self.isLoading = false
                }
            } catch {
                DispatchQueue.main.async {
                    self.errorMessage = "Failed to fetch data"
                    self.isLoading = false
                }
            }
        }
    }
    
    func getCoordinates(for city: String)->(lat: Double,lon: Double)?{
        let cities: [String: (Double, Double)] = [
            "ahmedabad": (23.0335, 72.5714),
            "mumbai": (19.0760,72.1025),
            "delhi" : (28.7041, 77.1025),
            "london" : (51.5072,-0.1276),
            "new york": (40.7128, -74.0060)
        ]
        return cities[city.lowercased()]
    }
    
    func getWeatherDescription(code: Int) -> String {
        switch code {
        case 0:
            return "Clear sky ☀️"
        case 1...3:
            return "Partly Cloudy ⛅️"
        case 45, 48:
            return "Fog 🌫️"
        case 51...67:
            return "Drizzle 🌦️"
        case 71...77:
            return "Snow ❄️"
        case 80...82:
            return "Rain 🌧️"
        case 95:
            return "Thunderstorm ⛈️"
        default:
            return "Unknown"
        }
    }
}


@main
struct WeatherApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

