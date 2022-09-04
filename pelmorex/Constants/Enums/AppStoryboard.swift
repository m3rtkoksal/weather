//
//  AppStoryboard.swift
//  pelmorex
//
//  Created by Mert Köksal on 3.09.2022.
//

import UIKit

enum AppStoryboard: String {
    
    case Main, Detail, Photo, Question

    var instance: UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
    
    func viewController<T: UIViewController>(viewControllerClass: T.Type) -> T {
        let storyboardID = (viewControllerClass as UIViewController.Type).storyboardID
        return instance.instantiateViewController(withIdentifier: storyboardID) as! T
    }
    
    func initialViewController() -> UIViewController? {
        return instance.instantiateInitialViewController()
    }
    
}

