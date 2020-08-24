//
//  WeatherController.swift
//  SoftSquared_w05_weather
//
//  Created by miori Lee on 2020/08/24.
//  Copyright © 2020 miori. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct WeatherController {
    
    private let API_KEY = "013e57e5a4fdfb7901cf58395cf115c0"
    //completion : @escaping (Result<WeatherData, Error>)->Void
    func fetchWeather(byCity city : String) {
        
        let query = city.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? city
        let path = "https://api.openweathermap.org/data/2.5/weather?q=%@&appid=%@&units=metric"
        let urlString = String(format: path, query, API_KEY)
        
        
        Alamofire.request(urlString).responseJSON { (response) in
            switch response.result{
            case .success(let weatherData):
                //print("weatherData : \(weatherData)")
                let weatherTemp : JSON = JSON(weatherData)
                let myTemp = weatherTemp["main"]["temp"]
                print("temp : \(myTemp)")
            case .failure(let error):
                print("error :\(error)")
            }
        }
        
        
        //        AF.request(urlString).responseDecodable(of: WeatherData.self, queue: .main, decoder: JSONDecoder()) { (response) in
        //            switch response.result{
        //            case .success(let weatherData):
        //                print("weatherData : \(weatherData)")
        //            case .failure(let error):
        //                print("error :\(error)")
        //            }
        //        }
        
        
        
        
    }
}
