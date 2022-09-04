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
    @IBOutlet weak var cityLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bigPhoto.image = selectedPhoto.photo
        self.cityLabel.label(textStr: selectedPhoto.city.title,
                             textColor: UIColor.orange,
                             textFont: UIFont.systemFont(ofSize: 15),
                             lineSpacing: -0.15,
                             paragraphStyle: NSMutableParagraphStyle())
    }
}
