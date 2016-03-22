//
//  HandoffHelper.swift
//  2016-03-22-HapticChallenge
//
//  Created by Thiago-Bernardes on 3/22/16.
//  Copyright © 2016 TB. All rights reserved.
//

import UIKit

struct Handoff {
    enum ActivityType : String {
        case HapticDetail = "TB.-016-03-22-HapticChallenge.HapticDetail"
        case HapticsTable = "TB.-016-03-22-HapticChallenge.HapticsTable"
        
    }
    
    static let ActivityValueKey = "ActivityValue"
    
    static let version = Version(key: "", number: 1)
    
}


struct Version {
    let key: String
    let number: Int
    
}


