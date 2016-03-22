//
//  HapticDetailViewController.swift
//  2016-03-22-HapticChallenge
//
//  Created by Thiago-Bernardes on 3/22/16.
//  Copyright © 2016 TB. All rights reserved.
//

import UIKit

class HapticDetailViewController: UIViewController {
    
    
    @IBOutlet weak var hapticDetailLabel: UILabel!
    
    var hapticTypeExplanation : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        hapticDetailLabel.text = hapticTypeExplanation
        
        
        // Do any additional setup after loading the view.
    }
    
        
}
