//
//  NetworkManager.swift
//  pelmorex
//
//  Created by Mert Köksal on 3.09.2022.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    func getWeatherList(degreeType: DegreeTypes, completed: @escaping (WeatherModel) -> ()) {
        for city in CityCodes.allCities {
            if let url = URL(string: "https://www.theweathernetwork.com/api/obsdata/\(city)/\(DegreeTypes.Celcius)") {
                let session = URLSession(configuration: .default)
                var request = URLRequest(url: url)
                request.httpMethod = "GET"
                let task = session.dataTask(with: request) { data, response, error in
                    if error == nil {
                        let decoder = JSONDecoder()
                        if let safeData = data {
                            do {
                                let result = try decoder.decode(WeatherModel.self, from: safeData)
                                DispatchQueue.main.async {
                                    completed(result)
                                }
                            } catch {
                                print(error)
                            }
                        }
                    }
                }
                task.resume()
            }
        }
        
    }
    
    func downloadCityWeatherDetails(city: CityCodes, degree: DegreeTypes ,completed: @escaping DownloadComplete) {
        
    }
}
