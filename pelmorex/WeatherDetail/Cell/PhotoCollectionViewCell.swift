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
        self.imageView.image = photo.photo
    }

}

extension PhotoCollectionViewCell: Reusable, NibLoadable { }
