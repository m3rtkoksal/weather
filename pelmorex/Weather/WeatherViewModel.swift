//
//  WeatherViewModel.swift
//  pelmorex
//
//  Created by Mert Köksal on 3.09.2022.
//

import Foundation

class WeatherViewModel: Decodable {
    
    var weatherModel: WeatherModel!
    private(set) var lbl_updatetime: String?
    private(set) var updatetime: String?
    private(set) var updatetime_stamp_gmt: String?
    private(set) var wxcondition: String?
    private(set) var icon: String?
    private(set) var inic: String?
    private(set) var temperature: Int?
    private(set) var feels_like: Int?
    private(set) var temperature_unit: String?
    private(set) var placecode: String?
    
    
    enum CodingKeys: String, CodingKey {
        case lbl_updatetime, updatetime, updatetime_stamp_gmt, wxcondition, icon, inic, temperature, feels_like, temperature_unit, placecode
    }
    //    private(set) var cityName: String?
    
    init(model: WeatherModel) {
        self.weatherModel = model
        self.lbl_updatetime = model.lbl_updatetime
        self.updatetime = model.updatetime
        self.updatetime_stamp_gmt = model.updatetime_stamp_gmt
        self.wxcondition = model.wxcondition
        self.icon = model.icon
        self.inic = model.inic
        self.temperature = Int(model.temperature)
        self.feels_like = Int(model.feels_like)
        self.temperature_unit = model.temperature_unit
        self.placecode = model.placecode
        //        self.cityName = getCityName()
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        lbl_updatetime = try values.decode(String.self, forKey: .lbl_updatetime)
        updatetime = try values.decode(String.self, forKey: .updatetime)
        updatetime_stamp_gmt = try values.decode(String.self, forKey: .updatetime_stamp_gmt)
        wxcondition = try values.decode(String.self, forKey: .wxcondition)
        icon = try values.decode(String.self, forKey: .icon)
        inic = try values.decode(String.self, forKey: .inic)
        temperature_unit = try values.decode(String.self, forKey: .temperature_unit)
        placecode = try values.decode(String.self, forKey: .placecode)
        // decode temperature, when it comes as a String
        if let theString = try? values.decode(String.self, forKey: .temperature),
           let temp = Int(theString) {
            temperature = temp
        } else {
            temperature = try values.decode(Int.self, forKey: .temperature)
        }
        
        // decode feels_like, when it comes as a String
        if let theString = try? values.decode(String.self, forKey: .feels_like),
           let feel_temp = Int(theString) {
            feels_like = feel_temp
        } else {
            feels_like = try values.decode(Int.self, forKey: .feels_like)
        }
        
    }
}
