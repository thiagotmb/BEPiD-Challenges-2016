//
//  InterfaceController.swift
//  WatchBordoes WatchKit Extension
//
//  Created by Thiago-Bernardes on 2/12/16.
//  Copyright © 2016 TMB. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    var unusedCatchphrases = Catchphrases.listOfPhrases.filter() {
        return !Catchphrase.savedCatchphrases().contains($0)
    }
    
    
    var currentCatchphraseIndex : Int = 0
    //    var savedCatchphrases : [String] = []
    
    var isShowingSavedCatchphrases = false
    
    @IBOutlet var catchphraseSaveIndicator: WKInterfaceLabel!
    @IBOutlet var catchphraseLabel: WKInterfaceLabel!
    
    @IBOutlet var nextCatchphraseButton: WKInterfaceButton!
    @IBOutlet var saveCatchphraseButton: WKInterfaceButton!
    @IBOutlet var showSavedCatchphrasesButton: WKInterfaceButton!
    
    @IBOutlet var savedCatchphrasesTable: WKInterfaceTable!
    
    @IBAction func nextCatchphraseAction() {
        showNextCatchphrase()
        
    }
    
    func randomCatchphrase() -> String{
        
        currentCatchphraseIndex = Int.random(unusedCatchphrases.count-1)()
        let catchphrase = unusedCatchphrases[currentCatchphraseIndex]
        return catchphrase
        
    }
    
    func showNextCatchphrase(){
        
        var currentPhrase = "Você já salvou todas as frases"
        
        if unusedCatchphrases.count > 0{
            currentPhrase = randomCatchphrase()
            saveCatchphraseButton.setEnabled(true)
            nextCatchphraseButton.setEnabled(true)
        }else{
            saveCatchphraseButton.setEnabled(false)
            nextCatchphraseButton.setEnabled(false)
        }
        
        catchphraseLabel.setAlpha(0)
        catchphraseLabel.setText(currentPhrase)
        animateWithDuration(0.5, animations: {() -> Void in
            
            self.catchphraseLabel.setAlpha(1)
            
        })
    }
    
    
    @IBAction func saveCatchphraseAction() {
        
        let currnetCatchphrase = unusedCatchphrases[currentCatchphraseIndex]
        
        Catchphrase.saveCatchphrase(currnetCatchphrase)
        unusedCatchphrases.removeAtIndex(currentCatchphraseIndex)
        
        self.catchphraseSaveIndicator.setAlpha(1)
        
        animateWithDuration(1, animations: {() -> Void in
            
            self.catchphraseSaveIndicator.setAlpha(0)
            
        })
        showNextCatchphrase()
        
    }
    
    
    @IBAction func showSavedCatchphrasesAction() {
        
        if isShowingSavedCatchphrases == true{
            clearTableData()
            isShowingSavedCatchphrases = false
            showSavedCatchphrasesButton.setTitle("Mostrar bordões")
            
        }else{
            loadTableData(Catchphrase.savedCatchphrases().count)
            isShowingSavedCatchphrases = true
            showSavedCatchphrasesButton.setTitle("Esconder bordões")
            
            
        }
        
    }
    
    private func loadTableData(numberOfRowsToShow: Int){
        
        
        savedCatchphrasesTable.setNumberOfRows(numberOfRowsToShow, withRowType: "CatchphraseTableRowController")
        
        if numberOfRowsToShow > 0 {
            for (index, catchphraseContent) in Catchphrase.savedCatchphrases().enumerate(){
                
                let row = savedCatchphrasesTable.rowControllerAtIndex(index) as! CatchphraseTableRowController
                
                row.saveCatchphraseLabel.setText(catchphraseContent)
            }
        }
        
        
    }
    
    private func clearTableData(){
        loadTableData(0)
        
    }
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        showNextCatchphrase()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    
}
