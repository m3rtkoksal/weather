//
//  WeatherTableViewCell.swift
//  pelmorex
//
//  Created by Mert Köksal on 3.09.2022.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

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
        self.cityName.text = model.placecode
//        let imageText = model.wxcondition
//        self.weatherImage.image = UIImage(named: imageText)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension WeatherTableViewCell: Reusable, NibLoadable { }
