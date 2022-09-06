//
//  WeatherDetailVC.swift
//  pelmorex
//
//  Created by Mert Köksal on 3.09.2022.
//

import UIKit

class WeatherDetailVC: UIViewController {
    var selectedCity: WeatherViewModel!
    var photoViewModel = PhotoImageViewModel()
    var vancPhotos: [PhotoModel] = []
    var calgPhotos: [PhotoModel] = []
    var ottPhotos: [PhotoModel] = []
    var torPhotos: [PhotoModel] = []
    var monPhotos: [PhotoModel] = []
    var photos: [PhotoModel] = []
    var photoSection : [CityCodes: Int] = [:]
    var router: (NSObjectProtocol & WeatherDetailRoutingLogic)?
    
    var sections = [[]]

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var lastUpdateLabel: UILabel!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated);
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
        self.setupView()
        self.assignbackground()
        self.configCollectionView()
        self.fillCellTypes()
    }
    
    func setup() {
        let viewController = self
        let router = WeatherDetailRouter()
        viewController.router = router
        router.viewController = viewController
    }
    
    func setupView() {
        cityNameLabel.label(textStr: selectedCity.placecode!.convertCodeToTitle(model: selectedCity),
                                 textColor: UIColor.black,
                                 textFont: UIFont.systemFont(ofSize: 30, weight: .bold),
                                lineSpacing: -0.13,
                                paragraphStyle: NSMutableParagraphStyle())
        
        conditionLabel.label(textStr: selectedCity.wxcondition!,
                                     textColor: UIColor.black,
                                     textFont: UIFont.systemFont(ofSize: 25, weight: .semibold),
                                    lineSpacing: -0.13,
                                    paragraphStyle: NSMutableParagraphStyle())
        
        temperatureLabel.label(textStr: String(selectedCity.temperature!) + "°" + selectedCity.temperature_unit!,
                                         textColor: UIColor.black,
                                         textFont: UIFont.systemFont(ofSize: 20, weight: .semibold),
                                        lineSpacing: -0.13,
                                        paragraphStyle: NSMutableParagraphStyle())
        
        
        feelsLikeLabel.label(textStr: String(selectedCity.feels_like!) + "°" + selectedCity.temperature_unit!,
                                                 textColor: UIColor.black,
                                                 textFont: UIFont.systemFont(ofSize: 20, weight: .semibold),
                                                lineSpacing: -0.13,
                                                paragraphStyle: NSMutableParagraphStyle())
        
        
        lastUpdateLabel.text = selectedCity.updatetime
    }
    
    func fillCellTypes() {
        sections.removeAll()
        photos.map {
            if let val: Int = photoSection[$0.city] {
                photoSection[$0.city] = val + 1
            } else {
                photoSection[$0.city] = 1
            }
        }
    }
    
    func assignbackground(){
            let imageText = selectedCity.icon
        let background = UIImage(named: imageText!)
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
        layout.estimatedItemSize = CGSize(width: 140, height: 140)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: UIScreen.main.bounds.width / 10, bottom: 0, right: 0)
        self.collectionView.collectionViewLayout = layout
        self.collectionView.backgroundColor = .clear
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.showsHorizontalScrollIndicator = false
        self.automaticallyAdjustsScrollViewInsets = true
        self.collectionView.register(PhotoCollectionViewCell.self)
    }
}


extension WeatherDetailVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(photoSection.values.count)
        return photos.count / photoSection.values.count
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath) as! PhotoCollectionViewCell
        let filteredPhotos = photos.filter({$0.city.rawValue == selectedCity.placecode!})
        for photo in photos {
            if photo.city.title == selectedCity.placecode {
                cell.setup(filteredPhotos[indexPath.row])
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.allowsMultipleSelection = false
        let filteredPhotos = photos.filter({$0.city.rawValue == selectedCity.placecode!})
        for photo in photos {
            if photo.city.title == selectedCity.placecode {
                router?.showPhoto(photo: filteredPhotos[indexPath.row])
            }
        }
    }
}
