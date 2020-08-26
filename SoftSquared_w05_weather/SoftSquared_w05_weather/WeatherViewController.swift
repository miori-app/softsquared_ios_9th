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
import AlamofireObjectMapper
//import SkeletonView

//값전달 delegate 만들기
protocol LabelChangedDelegate {
    func onChange()
}

class WeatherViewController: UIViewController {

    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var locLabel: UILabel!
    
    
    //deleagte 만들어 (이걸 만들어야 넘겨주는 뷰에서 델리게이트를 받아올수 있음)
    var delegaete : LabelChangedDelegate?
    
    
    private let weatherController = WeatherController()
    
    private let API_KEY = "input_your_apiKey"
    //completion : @escaping (Result<WeatherData, Error>)->Void
    func fetchWeather(byCity city : String) {
        
        let query = city.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? city
        let path = "https://api.openweathermap.org/data/2.5/weather?q=%@&appid=%@&units=metric"
        let urlString = String(format: path, query, API_KEY)
        
        //동기 비동기
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
        
/
        fetchWeather(byCity: "Seoul")
        locLabel.text = "Seoul"

        //fetchWeather()
        // Do any additional setup after loading the view.
        
        //weatherController.fetchWeather(byCity: "Seoul")
    
        
    }
    

    
    private func fetchWeather() {
  
    }
    
    @IBAction func locationTapped(_ sender: Any) {
    }
    
    @IBAction func addTapped(_ sender: Any) {
        //performSegue(withIdentifier: "showAddCity", sender: nil)
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "CitySearch") as! CitySearch
               
               //나를 넘김 (2. self정의로 이한몸 다바쳐서 간닷)
               secondViewController.prevViewController = self
               //이 한몸 다바쳐서 간거..
               self.present(secondViewController, animated: true, completion: nil)
    }
    
}

