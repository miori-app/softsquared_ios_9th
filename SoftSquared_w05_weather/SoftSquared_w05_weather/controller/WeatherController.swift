//
//  WeatherController.swift
//  SoftSquared_w05_weather
//
//  Created by miori Lee on 2020/08/24.
//  Copyright © 2020 miori. All rights reserved.
//

import Foundation
import Alamofire

struct WeatherController {
    
    private let API_KEY = "your_api_key"
    
    func fetchWeather(city : String){
        
        let query = city.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? city
        let path = "https://api.openweathermap.org/data/2.5/weather?q=%@&appid=%@units=metric"
        let urlString = String(format: path, city, API_KEY)
        
        AF.request(urlString).responseDecodable(of: WeatherData.self, queue: .main, decoder: JSONDecoder()) { (response) in
            switch response.result{
            case .success(let weatherData):
                print("weatherData : \(weatherData)")
            case .failure(let error):
                print("error :\(error.localizedDescription)")
                
            }
        }
    }
}
