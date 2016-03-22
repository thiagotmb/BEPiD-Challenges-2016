//
//  ViewController.swift
//  2016-03-22-HapticChallenge
//
//  Created by Thiago-Bernardes on 3/22/16.
//  Copyright © 2016 TB. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var hapticTableView: UITableView!
    
    var hapticTypesArray = [
        (".Click", "Indicates a simple click type of feedback. Use this haptic to mark fixed points along a path. Space out the intervals at which you play the haptic rather than playing it several times in quick succession."),
        (".DirectionDown", "Indicates a decrease in a specific value or when a value has gone below a certain threshold. For example, you could use this feedback when adjusting the value of a thermostat."),
        (".DirectionUp", "Indicates an increase in a specific value or when a value has gone above a certain threshold. For example, you could use this feedback when adjusting the value of a thermostat."),
        (".Failure", "Indicates the failed completion of a task or answering of a question."),
        (".Notification", "Alerts the user to an arrived notification when the Watch app is not running in the foreground."),
        (".Retry", "Indicates that the user should retry a task that temporarily failed."),
        (".Start", "Indicates the beginning of an action. For example, a stopwatch app uses this haptic when the user starts the stopwatch."),
        (".Stop", "Indicates the end of an action. For example, a stopwatch app uses this haptic when the user stops the stopwatch."),
        (".Success", "Indicates the successful completion of a task or the answering of a question.")
    ]
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("HapticCell")
        
        cell?.textLabel?.text = hapticTypesArray[indexPath.row].0
        
        
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let haptic = hapticTypesArray[indexPath.row]
        
        performSegueWithIdentifier("ShowHapticDetail", sender: haptic.1)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let vcToPush = segue.destinationViewController as! HapticDetailViewController
        vcToPush.hapticTypeExplanation = sender as! String
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return hapticTypesArray.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    override func restoreUserActivityState(activity: NSUserActivity) {
            if let hapticText = activity.userInfo?[Handoff.ActivityValueKey] as? String {
            performSegueWithIdentifier("ShowHapticDetail", sender: hapticText)
            }
        super.restoreUserActivityState(activity)
    }
    
}

