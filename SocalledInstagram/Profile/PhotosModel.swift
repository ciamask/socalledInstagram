//
//  PhotosModel.swift
//  SocalledInstagram
//
//  Created by cia on 12/01/2021.
//

import UIKit

struct photosModel {
    let cellPhotos: UIImage
}

struct photosData{
    private var data = [photosModel]()

    init() {
        data.append(photosModel(cellPhotos: #imageLiteral(resourceName: "p1")))
        data.append(photosModel(cellPhotos: #imageLiteral(resourceName: "p3")))
        data.append(photosModel(cellPhotos: #imageLiteral(resourceName: "p2")))
        data.append(photosModel(cellPhotos: #imageLiteral(resourceName: "p4")))
        data.append(photosModel(cellPhotos: #imageLiteral(resourceName: "cute")))
        data.append(photosModel(cellPhotos: #imageLiteral(resourceName: "p3")))
        data.append(photosModel(cellPhotos: #imageLiteral(resourceName: "p2")))
        data.append(photosModel(cellPhotos: #imageLiteral(resourceName: "p4")))
        data.append(photosModel(cellPhotos: #imageLiteral(resourceName: "p1")))
    }
    
    func getPhotos() -> [photosModel] {
        return data
    }
}

