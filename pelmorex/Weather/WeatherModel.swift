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
    var temperature: Int
    var feels_like: Int
    var temperature_unit: String
    var placecode: String
    
    enum CodingKeys: String, CodingKey {
        case lbl_updatetime, updatetime, updatetime_stamp_gmt, wxcondition, icon, inic, temperature, feels_like, temperature_unit, placecode
    }
    
    init(from decoder: Decoder) throws {
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
