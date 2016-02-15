//
//  InterfaceController.swift
//  desafio_3 WatchKit Extension
//
//  Created by Dennis Merli Rodrigues on 2/15/16.
//  Copyright © 2016 Dennis Merli Rodrigues. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    
    //Outlets
    
    @IBOutlet var phraseLabel: WKInterfaceLabel!
    @IBOutlet var saveButton: WKInterfaceButton!
    @IBOutlet var passButton: WKInterfaceButton!
    @IBOutlet var phrasesTable: WKInterfaceTable!
    @IBOutlet var eventDate: WKInterfaceDate!
    @IBOutlet var eventTimer: WKInterfaceTimer!
    
    var currentEvent : Event!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        self.getPhrase()
        self.loadTable()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    //MARK: Table
    
    func loadTable() {
        
        self.phrasesTable.setNumberOfRows(CatchyPhrasesDAO.sharedInstance.getPhrasesArray().count,
            withRowType: "phTable")
        
        for (index, event) in CatchyPhrasesDAO.sharedInstance.getPhrasesArray().enumerate() {
            let row = self.phrasesTable.rowControllerAtIndex(index)
                as! PhrasesRowController
            row.rowLabel.setText(event.title)
            self.startATimer(event,label: row.rowLabel)

        }
    }
    
    
    //MARK: Acoes
    
    
    @IBAction func passAction() {
        self.getPhrase()
    }
    
    @IBAction func saveAction() {
        
        CatchyPhrasesDAO.sharedInstance.insertPhrase(self.currentEvent) { (status) -> Void in
            if(status){
                //print("frase salva com sucesso!")
                self.passAction()
                self.loadTable()
            }
        }
    }
    
    //MARK: Carregar conteudo
    
    func getPhrase(){
        if let value : NSInteger = NSInteger.random(Events.listOfEvents.count)(){
            let eventTupla = Events.listOfEvents[value]
            self.currentEvent = Event(title: eventTupla.0, date: eventTupla.1)

            self.phraseLabel.setText(currentEvent.title)
        }
        
        
    }
 
    
    //MARK: Startar um timer
    
    func startATimer(event : Event, label: WKInterfaceLabel){
        
        
        print(event.date)
        
        let dateFormat = NSDateFormatter()
        dateFormat.dateFormat = "HH:mm"
        dateFormat.timeZone = NSTimeZone(name: "America/Sao_Paulo")
        let date = dateFormat.dateFromString(event.date)

        let calendar = NSCalendar(calendarIdentifier:NSCalendarIdentifierGregorian)
        let componentNow = calendar?.components([.Hour, .Minute], fromDate: NSDate())
        
        let componentEvent = calendar?.components([.Hour, .Minute], fromDate: date!)
        
        
        let hourInterval = (componentEvent!.hour - componentNow!.hour)*60
        let minuteInterval = (componentEvent!.minute - componentNow!.minute)
        let timerInverval = Double( (hourInterval + minuteInterval) * 60)
        
        self.performSelector("highlightCurrentEvent:", withObject: label, afterDelay: timerInverval)

        
    }
    
    
    //MARK: 
    func highlightCurrentEvent(label : WKInterfaceLabel?){
//        let event  = timer.userInfo as! Event
        
        label?.setTextColor(UIColor.greenColor())
//        if let index = CatchyPhrasesDAO.sharedInstance.getPhrasesArray().indexOf(event){
//            print(index)
//            
//            let tableRow = phrasesTable.rowControllerAtIndex(index) as! PhrasesRowController
//            tableRow.rowLabel.setTextColor(UIColor.greenColor())
//        }
        
    }

}
