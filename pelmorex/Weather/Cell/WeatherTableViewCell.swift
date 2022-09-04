//
//  WeatherTableViewCell.swift
//  pelmorex
//
//  Created by Mert Köksal on 3.09.2022.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var frameView: UIView!
    @IBOutlet weak var degreeTypeLabel: UILabel!
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var currentDegree: UILabel!
    
    
    public var nib = UINib(nibName: "WeatherTableViewCell", bundle: Bundle.main)
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupCell(model: WeatherModel) {
        self.cityName.text = model.placecode.convertCodeToTitle(model: model)
        let imageText = model.icon
        self.weatherImage.image = UIImage(named: imageText)
        self.currentDegree.text = String(model.temperature)
        self.frameView.layer.borderWidth = 2
        self.frameView.layer.borderColor = UIColor.systemGray3.cgColor
        self.frameView.backgroundColor = .systemGray5
        self.frameView.layer.shadowColor = UIColor.black.cgColor
        self.frameView.layer.cornerRadius = 8
        self.degreeTypeLabel.text = "°" + model.temperature_unit
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension WeatherTableViewCell: Reusable, NibLoadable { }
