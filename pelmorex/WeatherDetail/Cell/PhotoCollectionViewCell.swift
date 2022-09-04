//
//  PhotoCollectionViewCell.swift
//  pelmorex
//
//  Created by Mert Köksal on 4.09.2022.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    static let identifier = String(describing: PhotoCollectionViewCell.self)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(_ photo: PhotoModel) {
        switch photo.city {
        case .Toronto:
            self.imageView.image = photo.photo
        case .Montreal:
            self.imageView.image = photo.photo
        case .Ottawa:
            self.imageView.image = photo.photo
        case .Vancouver:
            self.imageView.image = photo.photo
        case .Calgary:
            self.imageView.image = photo.photo
        }
    }

}

extension PhotoCollectionViewCell: Reusable, NibLoadable { }
