//
//  CitySearch.swift
//  SoftSquared_w05_weather
//
//  Created by miori Lee on 2020/08/25.
//  Copyright © 2020 miori. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON
import AlamofireObjectMapper

class CitySearch: UIViewController, LabelChangedDelegate {
    func onChange() {
        //papago
        var engCity : String
        var url = "https://openapi.naver.com/v1/papago/n2mt"
        var params = ["source":"ko","target":"en","text":cityText.text!]
        var headers = ["Content-Type":"application/x-www-form-urlencoded; charset=UTF-8",
                       "X-Naver-Client-Id":"your_client_id",
                       "X-Naver-Client-Secret":"your_secret_id"]
        
        Alamofire.request(url, method: .post, parameters: params, encoding: URLEncoding.default, headers: headers).responseJSON { (response) in
            //print(response.result.value)
            switch response.result{
            case .success(let transData):
                let trans : JSON = JSON(transData)
                //print(trans)
                print(trans["message"]["result"]["translatedText"])
                print(trans["message"]["result"]["translatedText"].type)
                //guard trans["message"]["result"]["translatedText"] is String else { return }
                
//                self.prevViewController?.locLabel.text = engCity
//                self.prevViewController?.fetchWeather(byCity: engCity)
                
            case.failure(let error):
                print("error :\(error)")
            }
            
        }

        prevViewController?.locLabel.text = cityText.text
        prevViewController?.fetchWeather(byCity: cityText.text!)
    }
    
    
    @IBOutlet weak var cityText: UITextField!
    @IBAction func didTap(_ sender: Any) {
        onChange()
        
        dismiss(animated: true, completion: nil)
    }
    
    //이전 뷰를 정의 (둘이연결 1)
    var prevViewController : WeatherViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //상속한다음 이제 delegate가 나다!! 라는것을 정의 꼭 해야함
        prevViewController?.delegaete = self
            }
}

