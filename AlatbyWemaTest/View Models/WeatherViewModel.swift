//
//  WeatherViewModel.swift
//  AlatbyWemaTest
//
//  Created by Computer on 5/10/24.
//

import Foundation

class WeatherViewModel {
    private let weatherService: WeatherServiceProtocol
    
    init(weatherService: WeatherServiceProtocol = WeatherService()) {
        self.weatherService = weatherService
    }
    
   
    func fetchWeatherData(for city: String, completion: @escaping (Result<WeatherData, Error>) -> Void) {
        let geocodingURLString = "https://api.openweathermap.org/geo/1.0/direct?q=\(city)&appid=YOUR_API_KEY"

        guard let geocodingURL = URL(string: geocodingURLString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }

        let geocodingTask = URLSession.shared.dataTask(with: geocodingURL) { [weak self] (data, response, error) in
            guard let self = self else { return } // Unwrap weak self
            guard let data = data, error == nil else {
                completion(.failure(error ?? NSError(domain: "Unknown Error", code: 0, userInfo: nil)))
                return
            }

            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]], let location = json.first {
                    // Extract latitude and longitude from the first dictionary
                    if let lat = location["lat"] as? Double, let lon = location["lon"] as? Double {
                        // Fetch weather data using obtained latitude and longitude
                        self.weatherService.fetchWeatherData(latitude: lat, longitude: lon, completion: completion)
                        return
                    }
                }
                completion(.failure(NSError(domain: "Location Not Found", code: 0, userInfo: nil)))
            } catch {
                completion(.failure(error))
            }
        }
        geocodingTask.resume()
    }


}

