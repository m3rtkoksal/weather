//
//  WeatherRouter.swift
//  pelmorex
//
//  Created by Mert Köksal on 3.09.2022.
//

import Foundation

protocol WeatherRoutingLogic {
    func showWeatherDetail(city: WeatherModel?)
    func showQuestionVC()
}

class WeatherRouter: NSObject, WeatherRoutingLogic {
    
    weak var viewController: WeatherVC?
    
    func showWeatherDetail(city: WeatherModel?) {
        let weatherDetailVC = WeatherDetailVC.instantiateFrom(appStoryboard: .Detail)
        weatherDetailVC.selectedCity = city
        viewController?.navigationController?.pushViewController(weatherDetailVC, animated: true)
    }
    
    func showQuestionVC() {
        let questionVC = QuestionVC.instantiateFrom(appStoryboard: .Question)
        viewController?.navigationController?.pushViewController(questionVC, animated: true)
    }
    
}
