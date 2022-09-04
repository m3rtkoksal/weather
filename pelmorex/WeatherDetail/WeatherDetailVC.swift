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
    var vancPhotos: [PhotoModel] = []
    var calgPhotos: [PhotoModel] = []
    var ottPhotos: [PhotoModel] = []
    var torPhotos: [PhotoModel] = []
    var monPhotos: [PhotoModel] = []
    var photos: [PhotoModel] = []
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
        cityNameLabel.label(textStr: selectedCity.placecode.convertCodeToTitle(model: selectedCity),
                                 textColor: UIColor.black,
                                 textFont: UIFont.systemFont(ofSize: 30, weight: .bold),
                                lineSpacing: -0.13,
                                paragraphStyle: NSMutableParagraphStyle())
        
        conditionLabel.label(textStr: selectedCity.wxcondition,
                                     textColor: UIColor.black,
                                     textFont: UIFont.systemFont(ofSize: 25, weight: .semibold),
                                    lineSpacing: -0.13,
                                    paragraphStyle: NSMutableParagraphStyle())
        
        temperatureLabel.label(textStr: String(selectedCity.temperature) + "°" + selectedCity.temperature_unit,
                                         textColor: UIColor.black,
                                         textFont: UIFont.systemFont(ofSize: 20, weight: .semibold),
                                        lineSpacing: -0.13,
                                        paragraphStyle: NSMutableParagraphStyle())
        
        
        feelsLikeLabel.label(textStr: String(selectedCity.feels_like) + "°" + selectedCity.temperature_unit,
                                                 textColor: UIColor.black,
                                                 textFont: UIFont.systemFont(ofSize: 20, weight: .semibold),
                                                lineSpacing: -0.13,
                                                paragraphStyle: NSMutableParagraphStyle())
        
        
        lastUpdateLabel.text = selectedCity.updatetime
    }
    
    func fillCellTypes() {
        sections.removeAll()
        print("before",sections.count)
        sections.append(vancPhotos)
        sections.append(calgPhotos)
        sections.append(monPhotos)
        sections.append(ottPhotos)
        sections.append(torPhotos)
        print("after",sections.count)
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
        
        vancPhotos = photoViewModel.vancPhotos
        calgPhotos = photoViewModel.calgPhotos
        ottPhotos =  photoViewModel.ottPhotos
        torPhotos =  photoViewModel.torPhotos
        monPhotos =  photoViewModel.monPhotos

        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = CGSize(width: 94, height: 134)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        self.collectionView.collectionViewLayout = layout
        
        self.collectionView.collectionViewLayout = layout
        self.collectionView.backgroundColor = .clear
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.showsHorizontalScrollIndicator = false
        self.automaticallyAdjustsScrollViewInsets = false
        self.collectionView.register(PhotoCollectionViewCell.self)
    }
}


extension WeatherDetailVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("numberOfItemsInSection",sections[section].count)
        return sections[section].count
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        print("numberOfSections",sections.count)
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath) as! PhotoCollectionViewCell
        if selectedCity.placecode == "CAON0696" {
            cell.setup(torPhotos[indexPath.row])
        } else if selectedCity.placecode == "CAON0423" {
            cell.setup(monPhotos[indexPath.row])
        } else if selectedCity.placecode == "CAON0512"{
            cell.setup(ottPhotos[indexPath.row])
        } else if selectedCity.placecode == "CABC0308"{
            cell.setup(vancPhotos[indexPath.row])
        } else if selectedCity.placecode == "CAAB0049"{
            cell.setup(calgPhotos[indexPath.row])
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.allowsMultipleSelection = false
        if selectedCity.placecode == "CAON0696" {
            router?.showPhoto(photo: torPhotos[indexPath.row])
        } else if selectedCity.placecode == "CAON0423" {
            router?.showPhoto(photo: monPhotos[indexPath.row])
        } else if selectedCity.placecode == "CAON0423" {
            router?.showPhoto(photo: monPhotos[indexPath.row])
        } else if selectedCity.placecode == "CAON0512" {
            router?.showPhoto(photo: ottPhotos[indexPath.row] )
        } else if selectedCity.placecode == "CABC0308" {
            router?.showPhoto(photo: vancPhotos[indexPath.row])
        } else if selectedCity.placecode == "CAAB0049" {
            router?.showPhoto(photo: calgPhotos[indexPath.row])
        }
    }
}
