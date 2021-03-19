//
//  WeatherManager.swift
//  weatherics
//
//  Created by Yuşa Sarısoy on 19.03.2021.
//

import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?units=metric&appid=YOUR_APP_ID"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        // 1. Create a URL.
        if let url = URL(string: urlString) {
            // 2. Create a URLSession.
            let session = URLSession(configuration: .default)
            
            // 3. Give the session a task.
            let task = session.dataTask(with: url, completionHandler: handle(data:response:error:))
            
            // 4. Start the task.
            task.resume()
        }
    }
    
    func handle(data: Data?, response: URLResponse?, error: Error?) -> Void {
        if error != nil {
            print(error.debugDescription)
            return
        }
        
        if let safeData = data {
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString)
        }
    }
}
