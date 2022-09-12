//
//  Constants.swift
//  pelmorex
//
//  Created by Mert Köksal on 3.09.2022.
//

import Foundation

typealias DownloadComplete = () -> ()

enum DegreeTypes: String, CaseIterable {
    case Celcius = "c"
    case Fahrenheit = "f"
    
    static let allDegreeTypes = DegreeTypes.allCases.map { $0.rawValue }
}

enum CityCodes: String, CaseIterable {
    case Toronto = "CAON0696"
    case Montreal = "CAON0423"
    case Ottawa = "CAON0512"
    case Vancouver = "CABC0308"
    case Calgary = "CAAB0049"
    
    var title: String {
        return "\(self)" 
    }
    
    static let allCities = CityCodes.allCases.map { $0.rawValue }
}

let FORECAST_URL = "https://www.theweathernetwork.com/api/obsdata/\(CityCodes.Vancouver)/\(DegreeTypes.Celcius)"
