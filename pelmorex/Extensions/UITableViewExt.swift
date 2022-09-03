//
//  UITableViewExt.swift
//  pelmorex
//
//  Created by Mert Köksal on 3.09.2022.
//

import UIKit

extension UITableView {
    
    func tableViewHeight() -> CGFloat {
        self.layoutIfNeeded()
        return self.contentSize.height
    }
    
    func register<T: UITableViewCell>(_: T.Type) where T: Reusable, T: NibLoadable {
        register(T.nib, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T where T: Reusable {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier \(T.reuseIdentifier)")
        }
        return cell
    }
    
    // MARK: - Header Footer
    func register<T: UITableViewHeaderFooterView>(forHeaderFooter: T.Type) where T: Reusable, T: NibLoadable {
        register(T.nib, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(_: T.Type) -> T where T: Reusable {
        guard let header = dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as? T else {
            fatalError("Could not dequeue cell with identifier \(T.reuseIdentifier)")
        }
        return header
    }

}

extension UITableView {
    //    MARK: - TableView'ın reload olup olmadığını anlamamıza yarayan Bool
    private static var _isRefreshing = false
    var isRefreshing: Bool {
        get {
            return UITableView._isRefreshing
        } set(newValue) {
            UITableView._isRefreshing = newValue
        }
    }
    //    MARK: - Completion handler'lı reloadData fonksiyonu
    func reloadData(completion: @escaping ()->()) {
        UIView.animate(withDuration: 0, animations: { self.reloadData() })
        { _ in completion() }
    }
    //    MARK: - Kingfisher imageları set ederken tableview'ın reload olma durumu ve varsa lazy loading isRefreshing ile kontrol edilerek
    //    (isRefreshing false is asynchronous, true is synchronous şekilde image set ediliyor) image'ın kaybolma ve flick etme sorunu çözülüyor.
    func reloadDataWithIsRefreshing() {
        self.isRefreshing = true
        self.reloadData {
            self.isRefreshing = false
        }
    }
}

// MARK: Scroll Top & Bottom
extension UITableView {
    func scroll(to: scrollsTo, animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(300)) {
            let numberOfSections = self.numberOfSections
            let numberOfRows = self.numberOfRows(inSection: numberOfSections-1)
            switch to{
            case .top:
                if numberOfRows > 0 {
                    let indexPath = IndexPath(row: 0, section: 0)
                    self.scrollToRow(at: indexPath, at: .top, animated: animated)
                }
                break
            case .bottom:
                if numberOfRows > 0 {
                    let indexPath = IndexPath(row: numberOfRows-1, section: (numberOfSections-1))
                    self.scrollToRow(at: indexPath, at: .bottom, animated: animated)
                }
                break
            }
        }
    }
    
    enum scrollsTo {
        case top,bottom
    }
}

