//
//  TaskModel.swift
//  TouristComplicationChallenge
//
//  Created by Thiago-Bernardes on 4/7/16.
//  Copyright © 2016 TB. All rights reserved.
//

import WatchKit

class TaskModel: NSObject {

    var hour: NSDate!
    var name: String!
    var isDone: Bool!
    
    override init() {
        super.init()
    }
    
    init(hour: NSDate, name: String, isDone: Bool? = false) {
        super.init()
        self.hour = hour
        self.name = name
        self.isDone = isDone
    }
    
    static var savedTasks : [TaskModel]? {
        
        get {
            if let compressedTasks = NSUserDefaults.standardUserDefaults().valueForKey("tasks") as? [NSData] {
                var descompressedTasks = [TaskModel]()
                for compressedTask in compressedTasks {
                    let newMessage = TaskModel()
                    newMessage.decompressAndPopulateFromData(compressedTask)
                    descompressedTasks.append(newMessage)
                }
                return descompressedTasks
            } else {
                return [
                    TaskModel(hour:  NSDate().dateByAddingTimeInterval(-60*60*5), name: "Hotel Checkin"),
                    TaskModel(hour:  NSDate().dateByAddingTimeInterval(-60*60*3), name: "Meal time"),
                    TaskModel(hour:  NSDate().dateByAddingTimeInterval(-60*60*1), name: "Go to the beach"),
                    TaskModel(hour:  NSDate().dateByAddingTimeInterval(60*60*1), name: "Withdraw dollars"),
                    TaskModel(hour:  NSDate().dateByAddingTimeInterval(60*60*3), name: "Surf sessions"),
                    TaskModel(hour:  NSDate().dateByAddingTimeInterval(60*60*5), name: "Visit mont mistery")
                ]
            }
        }
        
        
        set {
            var compressedTasks : [NSData] = [NSData]()
            for (_,task) in newValue!.enumerate() {
                compressedTasks.append( task.compressForTransfer())
            }
            NSUserDefaults.standardUserDefaults().setValue(compressedTasks, forKey: "tasks")
        }
        
    }
    
    
    internal func toDictionary() -> [String : AnyObject] {
        
        
        var objectDict : [String : AnyObject] = [String : AnyObject]()
    
        objectDict["taskHour"] = hour
        objectDict["taskName"] =  name
        objectDict["taskIsDone"] =  isDone
        
        
        
        return objectDict
    }
    
    internal func populateFromDict(dict: [String : AnyObject]) {
        
        if let taskHour = dict["taskHour"] as? NSDate,
            let taskName = dict["taskName"] as? String,
            let taskIsDone = dict["taskIsDone"] as? Bool {
            self.name = taskName
            self.hour = taskHour
            self.isDone = taskIsDone
            
        }
    }
    
    internal func compressForTransfer() -> NSData{
        
        let objectDict = self.toDictionary()
        
        let compressedData = NSKeyedArchiver.archivedDataWithRootObject(objectDict)
        
        return compressedData
        
    }
    
    
    internal func decompressAndPopulateFromData(compressedData: NSData){
        
        let descompressedDict = NSKeyedUnarchiver.unarchiveObjectWithData(compressedData) as! [String : AnyObject]
        self.populateFromDict(descompressedDict)
        
    }
    
    
    
}
