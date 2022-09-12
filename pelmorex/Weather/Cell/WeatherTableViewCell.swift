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
    
    func setupCell(model: WeatherViewModel) {
        self.cityName.label(textStr: model.getCityName(),
                            textColor: UIColor.darkGray,
                            textFont: UIFont.systemFont(ofSize: 25, weight: .semibold),
                            lineSpacing: -0.25,
                            paragraphStyle: NSMutableParagraphStyle())
        
        let imageText = model.icon
        self.weatherImage.image = UIImage(named: imageText!)
        self.currentDegree.label(textStr: String(model.temperature!),
                            textColor: UIColor.darkGray,
                            textFont: UIFont.systemFont(ofSize: 25, weight: .semibold),
                            lineSpacing: -0.25,
                            paragraphStyle: NSMutableParagraphStyle())
        self.frameView.layer.borderWidth = 2
        self.frameView.layer.borderColor = UIColor.systemGray3.cgColor
        self.frameView.backgroundColor = .systemGray5
        self.frameView.layer.shadowColor = UIColor.black.cgColor
        self.frameView.layer.cornerRadius = 8
        self.degreeTypeLabel.label(textStr: "°" + model.temperature_unit!,
                                   textColor: UIColor.darkGray,
                                   textFont: UIFont.systemFont(ofSize: 25, weight: .semibold),
                                   lineSpacing: -0.25,
                                   paragraphStyle: NSMutableParagraphStyle())
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension WeatherTableViewCell: Reusable, NibLoadable { }
