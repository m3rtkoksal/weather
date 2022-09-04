//
//  UICollectionExt.swift
//  pelmorex
//
//  Created by Mert Köksal on 4.09.2022.
//

import UIKit

extension UICollectionView {
    func collectionViewWidth() -> CGFloat {
        self.layoutIfNeeded()
        return self.contentSize.width
    }
    
    func register<T: UICollectionViewCell>(_: T.Type) where T: Reusable, T: NibLoadable {
        register(T.nib, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T where T: Reusable {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue call with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
}
