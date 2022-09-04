//
//  WeatherDetailVC.swift
//  pelmorex
//
//  Created by Mert Köksal on 3.09.2022.
//

import UIKit

class WeatherDetailVC: UIViewController {
    var selectedCity: WeatherModel!
    var photoViewModel = PhotoImageViewModel()
    var photos: [PhotoModel] = []
    var router: (NSObjectProtocol & WeatherDetailRoutingLogic)?
    
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var lastUpdateLabel: UILabel!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    @IBOutlet weak var tempUnitLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
        self.setupView()
        self.assignbackground()
        self.configCollectionView()
    }
    
    func setup() {
        let viewController = self
        let router = WeatherDetailRouter()
        viewController.router = router
        router.viewController = viewController
    }
    
    func setupView() {
        cityNameLabel.label(textStr: selectedCity.placecode,
                                 textColor: UIColor.black,
                                 textFont: UIFont.systemFont(ofSize: 30, weight: .bold),
                                lineSpacing: -0.13,
                                paragraphStyle: NSMutableParagraphStyle())
        
        conditionLabel.label(textStr: selectedCity.wxcondition,
                                     textColor: UIColor.black,
                                     textFont: UIFont.systemFont(ofSize: 25, weight: .semibold),
                                    lineSpacing: -0.13,
                                    paragraphStyle: NSMutableParagraphStyle())
        
        temperatureLabel.label(textStr: "\(selectedCity.temperature)",
                                         textColor: UIColor.black,
                                         textFont: UIFont.systemFont(ofSize: 20, weight: .semibold),
                                        lineSpacing: -0.13,
                                        paragraphStyle: NSMutableParagraphStyle())
        
        tempUnitLabel.label(textStr: selectedCity.temperature_unit,
                                             textColor: UIColor.black,
                                             textFont: UIFont.systemFont(ofSize: 20, weight: .semibold),
                                            lineSpacing: -0.13,
                                            paragraphStyle: NSMutableParagraphStyle())
        
        feelsLikeLabel.label(textStr: "\(selectedCity.feels_like)",
                                                 textColor: UIColor.black,
                                                 textFont: UIFont.systemFont(ofSize: 20, weight: .semibold),
                                                lineSpacing: -0.13,
                                                paragraphStyle: NSMutableParagraphStyle())
        
        
        lastUpdateLabel.text = selectedCity.updatetime
    }
    
    func assignbackground(){
            let imageText = selectedCity.icon
            let background = UIImage(named: imageText)
            var imageView : UIImageView!
            imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.center
            imageView.clipsToBounds = true
            imageView.image = background
            imageView.center = view.center
            view.addSubview(imageView)
            self.view.sendSubviewToBack(imageView)
        }
    
    func configCollectionView() {
        photoViewModel.getPhotos()
        photos = photoViewModel.photos
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = CGSize(width: 94, height: 134)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        self.collectionView.collectionViewLayout = layout
        self.collectionView.backgroundColor = .clear
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.showsHorizontalScrollIndicator = false
        self.collectionView.register(PhotoCollectionViewCell.self)
    }
}


extension WeatherDetailVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath) as? PhotoCollectionViewCell
        cell!.setup(photoViewModel.photos[indexPath.row])
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.allowsMultipleSelection = false
        router?.showPhoto(photo: photoViewModel.photos[indexPath.row])
        self.collectionView.reloadData()
    }
}
