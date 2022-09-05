//
//  PhotoImageViewModel.swift
//  pelmorex
//
//  Created by Mert Köksal on 4.09.2022.
//

import UIKit

final class PhotoImageViewModel {
    
    var vancPhotos: [PhotoModel] = []
    var calgPhotos: [PhotoModel] = []
    var ottPhotos: [PhotoModel] = []
    var torPhotos: [PhotoModel] = []
    var monPhotos: [PhotoModel] = []
    
    func getPhotos() {
        vancPhotos = [
            PhotoModel(photo: UIImage(named: "Vancouver01")!, city: .Vancouver),
            PhotoModel(photo: UIImage(named: "Vancouver02")!, city: .Vancouver),
            PhotoModel(photo: UIImage(named: "Vancouver03")!, city: .Vancouver),
        ]
        calgPhotos = [
            PhotoModel(photo: UIImage(named: "Calgary01")!, city: .Calgary),
            PhotoModel(photo: UIImage(named: "Calgary02")!, city: .Calgary),
            PhotoModel(photo: UIImage(named: "Calgary03")!, city: .Calgary)
        ]
        ottPhotos = [
            PhotoModel(photo: UIImage(named: "Ottawa01")!, city: .Ottawa),
            PhotoModel(photo: UIImage(named: "Ottawa02")!, city: .Ottawa),
            PhotoModel(photo: UIImage(named: "Ottawa03")!, city: .Ottawa)
        ]
        torPhotos = [
            PhotoModel(photo: UIImage(named: "Toronto01")!, city: .Toronto),
            PhotoModel(photo: UIImage(named: "Toronto02")!, city: .Toronto),
            PhotoModel(photo: UIImage(named: "Toronto03")!, city: .Toronto)
        ]
        monPhotos = [
            PhotoModel(photo: UIImage(named: "Montreal01")!, city: .Montreal),
            PhotoModel(photo: UIImage(named: "Montreal02")!, city: .Montreal),
            PhotoModel(photo: UIImage(named: "Montreal03")!, city: .Montreal),
        ]
    }
}
