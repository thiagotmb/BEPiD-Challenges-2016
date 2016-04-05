//
//  Country.swift
//  2016-03-17-BackpackerChallenge
//
//  Created by Thiago-Bernardes on 3/17/16.
//  Copyright © 2016 TB. All rights reserved.
//

import WatchKit

class Country: NSObject {
    
    var name: String!
    var location: (Double,Double)!
    var videos : [(String,String)]!
    
    init(name: String, location: (Double,Double), videos: [(String,String)], audios: [(String,String)]) {
        self.name = name
        self.location = location
        self.videos = videos
    }
    
    static func loadCountries() -> [Country] {
        
        let videos = [(String,String)]()
        
        let thailand = Country(
            name: "Thailand",
            location: (13.736717,100.523186), videos:videos,
            audios: videos)
        
        
        let hawai = Country(
            name: "Hawai",
            location: (21.289373,-157.917480), videos:videos,
            audios: videos)
        
        let french = Country(
            name: "French",
            location: (48.864716,2.349014), videos:videos,
            audios: videos)
        
        
        return [thailand,hawai,french]
    }
    
}
