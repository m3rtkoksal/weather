//
//  WeatherVC.swift
//  pelmorex
//
//  Created by Mert Köksal on 3.09.2022.
//

import Foundation
import UIKit

class WeatherVC: UIViewController {
    
    var weathers = [WeatherViewModel]()
    var selectedDegreeType = DegreeTypes(rawValue: "c")
    private var viewModel : WeatherViewModel?
    @IBOutlet weak var degreeTypeSegment: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    var router: (NSObjectProtocol & WeatherRoutingLogic)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated);
    }
    
    func setup() {
        let viewController = self
        let router = WeatherRouter()
        viewController.router = router
        router.viewController = viewController
        NetworkManager.shared.getWeatherList(degreeType: .Celcius) { weather in
            DispatchQueue.main.async {
                self.weathers.append(weather)
                self.configureTable()
                self.updateMainUI()
            }
        }
    }
    
    @IBAction func questionButtonTapped(_ sender: UIButton) {
        router?.showQuestionVC()
    }
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        self.weathers = []
        if sender.selectedSegmentIndex == 0 {
            selectedDegreeType = DegreeTypes.Celcius
        } else {
            selectedDegreeType = DegreeTypes.Fahrenheit
        }
        NetworkManager.shared.getWeatherList(degreeType: selectedDegreeType!) { weather in
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
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router?.showWeatherDetail(city: weathers[indexPath.row])
    }
}
