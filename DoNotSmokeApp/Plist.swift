//
//  Plist.swift
//  DoNotSmokeApp
//
//  Created by Guilherme Marques on 7/22/16.
//  Copyright © 2016 Isabela Pereira. All rights reserved.
//

import Foundation

struct Plist {

    // Plist Error to hold our error. Used when trying to save data
    enum PlistError: ErrorType {
        case FileNotWritten
        case FileDoesNotExist
    }
    // Plist name
    let name: String
    
    // Computed property that represents the location of the plist in the bundle
    var sourcePath: String? {
        guard let path = NSBundle.mainBundle().pathForResource(name, ofType: "plist") else {return .None}
        return path
    }
    
    // Computed property that represents the documents directory.
    var destPath: String? {
        guard sourcePath != .None else {return .None}
        let dir = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0]
        return (dir as NSString).stringByAppendingPathComponent("\(name).plist")
    }
    
    init?(name: String) {
        
        self.name = name
        // File system object
        let fileManager = NSFileManager.defaultManager()
        // Checking source and destination Path
        guard let source = sourcePath else { return nil }
        guard let destination = destPath else { return nil }
        guard fileManager.fileExistsAtPath(source) else { return nil }
        
        // Copy the plist from the main bundle, but check if the file is already there to prevent overwriting it.
        if !fileManager.fileExistsAtPath(destination) {
            
            // Copy the file
            do {
                try fileManager.copyItemAtPath(source, toPath: destination)
            } catch let error as NSError {
                print("Unable to copy file. ERROR: \(error.localizedDescription)")
                return nil
            }
        }
        
    }
    
    // Get the values from the plist file as a NSDictionary
    func getValuesInPlistFile() -> NSDictionary? {
        let fileManager = NSFileManager.defaultManager()
        if fileManager.fileExistsAtPath(destPath!) {
            guard let dict = NSDictionary(contentsOfFile: destPath!) else { return .None }
            return dict
        } else {
            return .None
        }
    }
    
    // Get the values from the plist file as a NSMutableDictionary to modify it
    func getMutablePListFile() -> NSMutableDictionary? {
        let fileManager = NSFileManager.defaultManager()
        if fileManager.fileExistsAtPath(destPath!) {
            guard let dict = NSMutableDictionary(contentsOfFile: destPath!) else { return .None }
            return dict
        } else {
            return .None
        }
    }
    
    // Save the changes in the plist file
    func addValuesToPlistFile(dictionary: NSDictionary) throws {
        let fileManager = NSFileManager.defaultManager()
        if fileManager.fileExistsAtPath(destPath!) {
            if !dictionary.writeToFile(destPath!, atomically: false) {
                print("File Not written successfully")
                throw PlistError.FileNotWritten
            }
        } else {
            throw PlistError.FileDoesNotExist
        }
    }
}