//
//  WeatherModel.swift
//  pelmorex
//
//  Created by Mert Köksal on 3.09.2022.
//

import Foundation

struct WeatherModel: Codable, Hashable {
    var lbl_updatetime: String
    var updatetime: String
    var updatetime_stamp_gmt: String
    var wxcondition: String
    var icon: String
    var inic: String
    var temperature: String
    var feels_like: String
    var temperature_unit: String
    var placecode: String
}
