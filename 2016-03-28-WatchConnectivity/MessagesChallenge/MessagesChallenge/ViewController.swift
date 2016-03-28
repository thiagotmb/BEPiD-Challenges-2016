//
//  ViewController.swift
//  MessagesChallenge
//
//  Created by Thiago-Bernardes on 3/28/16.
//  Copyright © 2016 TB. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var messages: [String] = ["TESTE","TESTE","TESTE","TESTE"]
    
    @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var toolBar: UIToolbar!
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func sendMessage(sender: AnyObject) {
    }
    
    @IBAction func sendPhoto(sender: AnyObject) {
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
         cell.transform = CGAffineTransformMakeRotation(CGFloat(-M_PI))
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.transform = CGAffineTransformMakeRotation(CGFloat(-M_PI))
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

