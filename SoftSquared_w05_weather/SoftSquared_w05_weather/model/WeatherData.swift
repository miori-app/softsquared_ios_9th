//
//  WeatherData.swift
//  SoftSquared_w05_weather
//
//  Created by miori Lee on 2020/08/24.
//  Copyright © 2020 miori. All rights reserved.
//

import Foundation

struct WeatherData : Decodable {
    
    let cityName : String
    let main : Main
    let weather : [Weather]
    
}

struct Main : Decodable {
    
    let temp : Double
}

struct Weather : Decodable {
    
    let id : Int
    let main : String
    let description : String
}
