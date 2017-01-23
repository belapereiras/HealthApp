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
    enum PlistError: Error {
        case fileNotWritten
        case fileDoesNotExist
    }
    // Plist name
    let name: String
    
    // Computed property that represents the location of the plist in the bundle
    var sourcePath: String? {
        guard let path = Bundle.main.path(forResource: name, ofType: "plist") else {return .none}
        return path
    }
    
    // Computed property that represents the documents directory.
    var destPath: String? {
        guard sourcePath != .none else {return .none}
        let dir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        return (dir as NSString).appendingPathComponent("\(name).plist")
    }
    
    init?(name: String) {
        
        self.name = name
        // File system object
        let fileManager = FileManager.default
        // Checking source and destination Path
        guard let source = sourcePath else { return nil }
        guard let destination = destPath else { return nil }
        guard fileManager.fileExists(atPath: source) else { return nil }
        
        // Copy the plist from the main bundle, but check if the file is already there to prevent overwriting it.
        if !fileManager.fileExists(atPath: destination) {
            
            // Copy the file
            do {
                try fileManager.copyItem(atPath: source, toPath: destination)
            } catch let error as NSError {
                print("Unable to copy file. ERROR: \(error.localizedDescription)")
                return nil
            }
        }
        
    }
    
    // Get the values from the plist file as a NSDictionary
    func getValuesInPlistFile() -> NSDictionary? {
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: destPath!) {
            guard let dict = NSDictionary(contentsOfFile: destPath!) else { return .none }
            return dict
        } else {
            return .none
        }
    }
    
    // Get the values from the plist file as a NSMutableDictionary to modify it
    func getMutablePListFile() -> NSMutableDictionary? {
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: destPath!) {
            guard let dict = NSMutableDictionary(contentsOfFile: destPath!) else { return .none }
            return dict
        } else {
            return .none
        }
    }
    
    // Save the changes in the plist file
    func addValuesToPlistFile(_ dictionary: NSDictionary) throws {
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: destPath!) {
            if !dictionary.write(toFile: destPath!, atomically: false) {
                print("File Not written successfully")
                throw PlistError.fileNotWritten
            }
        } else {
            throw PlistError.fileDoesNotExist
        }
    }
}
