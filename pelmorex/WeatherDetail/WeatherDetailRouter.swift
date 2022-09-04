//
//  WeatherDetailRouter.swift
//  pelmorex
//
//  Created by Mert Köksal on 4.09.2022.
//
import Foundation
import UIKit

protocol WeatherDetailRoutingLogic {
    func showPhoto(photo: PhotoModel?)
}

class WeatherDetailRouter: NSObject, WeatherDetailRoutingLogic {
    
    weak var viewController: WeatherDetailVC?
    
    func showPhoto(photo: PhotoModel?) {
        let photoVC = PhotoVC.instantiateFrom(appStoryboard: .Photo)
        photoVC.selectedPhoto = photo
        viewController?.navigationController?.present(photoVC, animated: true)
    }
}
