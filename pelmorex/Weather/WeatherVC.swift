//
//  WeatherVC.swift
//  pelmorex
//
//  Created by Mert Köksal on 3.09.2022.
//

import Foundation
import UIKit

class WeatherVC: UIViewController {
    
    var weathers = [WeatherModel]()
    
    @IBOutlet weak var degreeTypeSegment: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.shared.getWeatherList(degreeType: .Celcius) { weather in
            DispatchQueue.main.async {
                self.weathers.append(weather)
                self.updateMainUI()
                self.configureTable()
            }
            
        }
    }
    
    @IBAction func segmentChanged(_ sender: Any) {
        NetworkManager.shared.getWeatherList(degreeType: .Fahrenheit) { weather in
            DispatchQueue.main.async {
                self.weathers.append(weather)
                self.updateMainUI()
                self.configureTable()
            }
        }
    }
    
    func configureTable() {
        tableView.register(WeatherTableViewCell.self)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
    }
    
    func updateMainUI() {
        tableView.reloadData()
    }
}

extension WeatherVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weathers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherTableViewCell") as! WeatherTableViewCell
        cell.setupCell(model: weathers[indexPath.row])
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
}
