//
//  WeatherViewController.swift
//  AlatbyWemaTest
//
//  Created by Computer on 5/10/24.
//

import UIKit

class WeatherViewController: UIViewController {
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var weatherDescriptionLabel: UILabel!

    var viewModel = WeatherViewModel()
    var cityName: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchWeatherData()
    }

    func fetchWeatherData() {
           guard let cityName = cityName else {
               
               return
           }

            viewModel.fetchWeatherData(for: cityName) { [weak self] result in
                        DispatchQueue.main.async {
                            switch result {
                            case .success(let weatherData):
                                self?.updateUI(with: weatherData)
                            case .failure(let error):
                                print("Error fetching weather data: \(error)")
                                // Handle error
                            }
                        }
                    }
       }


    func updateUI(with weatherData: WeatherData) {
        temperatureLabel.text = "\(weatherData.main.temp)°K"
        humidityLabel.text = "\(weatherData.main.humidity)%"
        weatherDescriptionLabel.text = weatherData.weather.first?.description ?? "N/A"
    }
}

