//
//  HomeViewController.swift
//  AlatbyWemaTest
//
//  Created by Computer on 5/10/24.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var cityTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func searchButtonTapped(_ sender: UIButton) {
        guard let cityName = cityTextField.text, !cityName.isEmpty else {
            // Handle empty city name error
            return
        }

        // Perform navigation to WeatherViewController and pass the city name
        if let weatherVC = storyboard?.instantiateViewController(withIdentifier: "WeatherViewController") as? WeatherViewController {
            weatherVC.cityName = cityName
            navigationController?.pushViewController(weatherVC, animated: true)
        }
    }
}

