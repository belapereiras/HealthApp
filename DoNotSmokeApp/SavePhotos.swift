//
//  SavePhotos.swift
//  DoNotSmokeApp
//
//  Created by Priscila Rosa on 8/1/16.
//  Copyright © 2016 Isabela Pereira. All rights reserved.
//

import Foundation
import UIKit

class SavePhotos {
    static var savePhotos = SavePhotos()
    
    static func getSPSingleton() -> SavePhotos {
        return savePhotos
    }
    
    var imagesDirectoryPath:String = ""
    
    func createImageFolder() {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        // Get the Document directory path
        let documentDirectorPath:String = paths[0]
        // Create a new path for the new images folder
        imagesDirectoryPath = documentDirectorPath + "/ImagePicker"
        var objcBool:ObjCBool = true
        let isExist = FileManager.default.fileExists(atPath: imagesDirectoryPath, isDirectory: &objcBool)
        // If the folder with the given path doesn't exist already, create it
        if isExist == false{
            do{
                try FileManager.default.createDirectory(atPath: imagesDirectoryPath, withIntermediateDirectories: true, attributes: nil)
            }catch{
                print("Something went wrong while creating a new folder")
            }
        }
    }
    
    func saveLocally(_ finalImage: UIImage) {
        var imagePath = Date().description
        imagePath = imagePath.replacingOccurrences(of: " ", with: "")
        imagePath = imagesDirectoryPath + "/\(imagePath).png"
        
        let data = UIImagePNGRepresentation(finalImage)
        FileManager.default.createFile(atPath: imagePath, contents: data, attributes: nil)
        
    }

}
