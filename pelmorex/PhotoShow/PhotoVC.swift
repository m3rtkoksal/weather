//
//  PhotoVC.swift
//  pelmorex
//
//  Created by Mert Köksal on 4.09.2022.
//

import UIKit

class PhotoVC: UIViewController {
    var selectedPhoto: PhotoModel!
    @IBOutlet weak var bigPhoto: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bigPhoto.image = selectedPhoto.photo
    }
}
