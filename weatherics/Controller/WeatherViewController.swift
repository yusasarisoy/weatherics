//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate, WeatherManagerDelegate {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var textFieldSearch: UITextField!
    
    private var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherManager.delegate = self // Assign this class as a delegeate of the WeatherManager.
        textFieldSearch.delegate = self // Assign this class as a delegeate of the UITextField.
    }
    
    @IBAction func searchPressed(_ sender: UIButton) {
        textFieldSearch.endEditing(true) // End editing, close the keyboard.
        print(textFieldSearch.text!)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textFieldSearch.endEditing(true) // End editing, close the keyboard.
        print(textFieldSearch.text!)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textFieldSearch.text != "" {
            return true
        } else {
            textField.placeholder = "Type something"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = textField.text {
            weatherManager.fetchWeather(cityName: city)
        }
        
        textFieldSearch.text = ""
    }
    
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        print(weather.temperature)
    }
    
    func didFailWithError(_ error: Error) {
        print(error)
    }
}
