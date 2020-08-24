//
//  ViewController.swift
//  SoftSquared_w05_weather
//
//  Created by miori Lee on 2020/08/24.
//  Copyright © 2020 miori. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
//import SkeletonView

protocol changeLabel {
    func changeTemp ()
}

class WeatherViewController: UIViewController {

    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    private let weatherController = WeatherController()
    
    private let API_KEY = "your api"
    //completion : @escaping (Result<WeatherData, Error>)->Void
    func fetchWeather(byCity city : String) {
        
        let query = city.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? city
        let path = "https://api.openweathermap.org/data/2.5/weather?q=%@&appid=%@&units=metric"
        let urlString = String(format: path, query, API_KEY)
        
        
        Alamofire.request(urlString).responseJSON { (response) in
            switch response.result{
            case .success(let weatherData):
                //print("weatherData : \(weatherData)")
                let weather : JSON = JSON(weatherData)
                let myTemp = weather["main"]["temp"]
                let myDetail = weather["weather"][0]["description"]
                print("temp : \(myTemp)")
                print("Detail : \(myDetail)")
                self.tempLabel.text = "\(myTemp)"
                self.detailLabel.text = "\(myDetail)"
            case .failure(let error):
                print("error :\(error)")
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchWeather(byCity: "Seoul")

        //fetchWeather()
        // Do any additional setup after loading the view.
        
        //weatherController.fetchWeather(byCity: "Seoul")
    
        
    }
    

    
    private func fetchWeather() {
  
    }
    
    @IBAction func locationTapped(_ sender: Any) {
    }
    
    @IBAction func addTapped(_ sender: Any) {
    }
    
}

