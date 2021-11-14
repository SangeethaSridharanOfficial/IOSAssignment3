//
//  ImagesManager.swift
//  Assignment3
//
//  Created by user202299 on 11/13/21.
//

import Foundation

class ImagesManager{
    private var listOfImages = [ImagesInfo]()
    
    func addNewImageInfo(imageInfo: ImagesInfo){
        listOfImages.append(imageInfo)
    }
    
    func getAllImagesInfo() -> [ImagesInfo] {
        return listOfImages
    }
}
