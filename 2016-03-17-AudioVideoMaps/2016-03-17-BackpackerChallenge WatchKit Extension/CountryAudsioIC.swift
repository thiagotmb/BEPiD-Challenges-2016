//
//  CountryAudsioIC.swift
//  2016-03-17-BackpackerChallenge
//
//  Created by Thiago-Bernardes on 3/17/16.
//  Copyright © 2016 TB. All rights reserved.
//

import WatchKit
import Foundation


class CountryAudsioIC: WKInterfaceController {
    @IBOutlet var recordedAudiosTable: WKInterfaceTable!
    
    var currentCountry : Country!
    
    var audioNames = [String]()
    
    let fileManager = NSFileManager.defaultManager()
    
    
    func countrySaveDirectory() -> String? {
        
        let documentsURLString: AnyObject = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0]
        
        let saveURL = documentsURLString.stringByAppendingPathComponent(currentCountry.name)
        
        if fileManager.fileExistsAtPath(saveURL) == false {
            do {
                try fileManager.createDirectoryAtPath(saveURL, withIntermediateDirectories: false, attributes: nil)
            } catch {
                print (error)
                return nil
                
            }
        }
        
        return saveURL
        
    }
    
    func getCountryAudioFilesName() -> [String] {
        
        
        var audioFilesNames = [String]()
        
        if let saveUrlString = countrySaveDirectory() {
            
            let files = NSFileManager().enumeratorAtPath(saveUrlString)
            while let file: AnyObject = files?.nextObject() {
                audioFilesNames.append(file as! String)
            }
            print(audioFilesNames)
        }
        
        return audioFilesNames
        
    }
    
    @IBAction func recordNewAudio() {
        
        
        let duration = NSTimeInterval(10)
        
        let recordOptions =
        [WKAudioRecorderControllerOptionsMaximumDurationKey : duration]
        
        let countrySaveDirectoryUrl = NSURL(fileURLWithPath: countrySaveDirectory()!).URLByAppendingPathComponent(newAudioName())
        
        presentAudioRecorderControllerWithOutputURL(countrySaveDirectoryUrl,
            preset: .NarrowBandSpeech,
            options: recordOptions,
            completion: { saved, error in
                
                if let err = error {
                    print(err.description)
                }
                
                if saved {
                    
                    
                }
        })
        
    }
    
    func newAudioName() -> String {
        
        return "\(currentCountry.name)-audio\(audioNames.count).wav"
        
    }
    
    func loadTable() {
        
        recordedAudiosTable.setNumberOfRows(audioNames.count, withRowType: "CountryAudioRowType")
        
        for (index,audioName) in audioNames.enumerate() {
            
            let currentRow = recordedAudiosTable.rowControllerAtIndex(index) as! CountryAudioRowController
            
            currentRow.audioName = audioName
            
        }
        
    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        
        let rowController = table.rowControllerAtIndex(rowIndex) as! CountryAudioRowController
        
        let countryAudioDirectoryUrl = NSURL(fileURLWithPath: countrySaveDirectory()!).URLByAppendingPathComponent(rowController.audioName)
        
        let options = [WKMediaPlayerControllerOptionsAutoplayKey : "true"]
        
        presentMediaPlayerControllerWithURL(countryAudioDirectoryUrl, options: options,
            completion: { didPlayToEnd, endTime, error in
                if let err = error {
                    print(err.description)
                }
        })
        
    }
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        currentCountry = context as! Country
        
        
        // Configure interface objects here.
    }
    
    
    override func willActivate() {
        
        audioNames = getCountryAudioFilesName()
        loadTable()
        
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    
    
}
