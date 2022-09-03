//
//  UIViewControllerExt.swift
//  pelmorex
//
//  Created by Mert Köksal on 3.09.2022.
//

import UIKit

// MARK: - Multiple Storyboard

extension UIViewController {
    class var storyboardID: String {
        return "\(self)"
    }
    
    static func instantiateFrom(appStoryboard: AppStoryboard) -> Self {
        return appStoryboard.viewController(viewControllerClass: self)
    }
}
