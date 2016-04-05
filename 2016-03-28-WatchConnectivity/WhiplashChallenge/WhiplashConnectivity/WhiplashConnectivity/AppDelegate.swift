//
//  AppDelegate.swift
//  WhiplashConnectivity
//
//  Created by Thiago-Bernardes on 4/5/16.
//  Copyright © 2016 TB. All rights reserved.
//

import UIKit
import WatchConnectivity
import AVFoundation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, WCSessionDelegate {

    var window: UIWindow?
    var session: WCSession!
    var audioPlayer = AVAudioPlayer()


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        if WCSession.isSupported() {
            session = WCSession.defaultSession()
            session.delegate = self
            session.activateSession()
        }
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    override func motionBegan(motion: UIEventSubtype, withEvent event: UIEvent?) {
        playWhiplash()
        sendWhiplash()
        
    }
    
    func sendWhiplash() {
        dispatch_async(dispatch_get_main_queue(), {
            let dict = ["whiplash":1]
            self.session.sendMessage(dict, replyHandler: { (reply : [String : AnyObject]) in
                print("whiplash sended")
            }) { (error: NSError) in
                print("whiplash not sended", error)

            }
        })
        
    }

    
    func playWhiplash() {
        dispatch_async(dispatch_get_main_queue(), {
            if let effectPath = NSBundle.mainBundle().pathForResource(self.whiplashName(), ofType: "mp3") {
                let whipSoundURL = NSURL(fileURLWithPath:effectPath)
                do {
                    try self.audioPlayer = AVAudioPlayer(contentsOfURL: whipSoundURL)
                    self.audioPlayer.prepareToPlay()
                    self.audioPlayer.play()
                    
                } catch {
                    print("player not play", error)
                }
            }
        })
        
    }
    
    func whiplashName() -> String {
        
        let randomSoundNumber = arc4random_uniform(2)
        
        return "whip\(randomSoundNumber)"
 
    }
}

