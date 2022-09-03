//
//  WeatherViewModel.swift
//  pelmorex
//
//  Created by Mert Köksal on 3.09.2022.
//

import Foundation

class WeatherViewModel {
    
    var weatherModel: WeatherModel!
    private(set) var lbl_updatetime: String?
    private(set) var updatetime: String?
    private(set) var updatetime_stamp_gmt: String?
    private(set) var wxcondition: String?
    private(set) var icon: String?
    private(set) var inic: String?
    private(set) var temperature: String?
    private(set) var feels_like: String?
    private(set) var temperature_unit: String?
    private(set) var placecode: String?
    
    init(model: WeatherModel) {
        self.lbl_updatetime = model.lbl_updatetime
        self.updatetime = model.updatetime
        self.updatetime_stamp_gmt = model.updatetime_stamp_gmt
        self.wxcondition = model.wxcondition
        self.icon = model.icon
        self.inic = model.inic
        self.temperature = model.temperature
        self.feels_like = model.feels_like
        self.temperature_unit = model.temperature_unit
        self.placecode = model.placecode
    }
}
