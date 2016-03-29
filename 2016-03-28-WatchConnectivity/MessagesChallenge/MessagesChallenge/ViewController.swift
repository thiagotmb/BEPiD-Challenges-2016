//
//  ViewController.swift
//  MessagesChallenge
//
//  Created by Thiago-Bernardes on 3/28/16.
//  Copyright © 2016 TB. All rights reserved.
//

import UIKit
import WatchConnectivity


class ViewController: UIViewController {
    var messages: [MessageModel] = [MessageModel]()
    var session: WCSession!
    let imagePicker = UIImagePickerController()
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var toolBar: UIToolbar!
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func sendMessage(sender: AnyObject) {
        
        
        let message = MessageModel()
        message.messageText = textField.text
        message.messageSender = .Iphone
        
        addNewMessage(message)
        sendMessageToWatch(message)
        
        
    }
    
    @IBAction func sendPhoto(sender: AnyObject) {
        
        
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        imagePicker.allowsEditing = false
        
        self.presentViewController(imagePicker, animated: true,
                                   completion: nil)
        
        
    }
    
    
    
    func addNewMessage(newMessage : MessageModel) {
        
        messages.insert(newMessage, atIndex: 0)
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Bottom)
        let cell = tableView.cellForRowAtIndexPath(indexPath) as! MessageRowTableViewCell
        cell.message = newMessage
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.transform = CGAffineTransformMakeRotation(CGFloat(-M_PI))
        tableView.rowHeight = UITableViewAutomaticDimension
        
        initWCSession()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    
}


extension ViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        let message = MessageModel()
        message.messageSender = .Iphone
        message.messageData = UIImagePNGRepresentation(image)
        addNewMessage(message)
        sendMessageToWatch(message)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("MessageCell") as! MessageRowTableViewCell
        
        cell.transform = CGAffineTransformMakeRotation(CGFloat(-M_PI))
        
        cell.message = messages[indexPath.row]
        
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 45
    }
    
}

extension ViewController : WCSessionDelegate {
    
    
    
    func initWCSession() {
        
        if WCSession.isSupported() {
            
            session = WCSession.defaultSession()
            session.delegate = self
            session.activateSession()
        }
        
    }
    
    func sendMessageToWatch(message: MessageModel) {
        
        dispatch_async(dispatch_get_main_queue(), {
            
            var dict : [String : AnyObject] = ["message":message.compressForTransfer()]

            if message.messageText != nil {

                self.session.transferUserInfo(dict)
                
            } else {

                let myImageName = "imagesTransferChallenge\(self.messages.count).png"
                let imagePath = self.fileInDocumentsDirectory(myImageName)
                self.saveImage(UIImage(data: message.messageData)!, path: imagePath)
                let url = NSURL(fileURLWithPath: imagePath)
                
                dict["fileUrl"] = url.absoluteString
                self.session.transferUserInfo(dict)
                
            }
 
        })
        
        
    }
    
    
    func session(session: WCSession, didReceiveUserInfo userInfo: [String : AnyObject]) {
        
        dispatch_async(dispatch_get_main_queue(), {
            if let messageData = userInfo["message"] as? NSData {
                let newMessage = MessageModel()
                newMessage.decompressAndPopulateFromData(messageData)
                self.addNewMessage(newMessage)
                
            }
            
        })
        
    }
    
    func getDocumentsURL() -> NSURL {
        let documentsURL = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
        return documentsURL
    }
    
    func fileInDocumentsDirectory(filename: String) -> String {
        
        let fileURL = getDocumentsURL().URLByAppendingPathComponent(filename)
        return fileURL.path!
        
    }
    
    func saveImage (image: UIImage, path: String ) -> Bool{
        
        let pngImageData = UIImagePNGRepresentation(image)
        //let jpgImageData = UIImageJPEGRepresentation(image, 1.0)   // if you want to save as JPEG
        let result = pngImageData!.writeToFile(path, atomically: true)
        
        return result
        
    }

    
    
}

