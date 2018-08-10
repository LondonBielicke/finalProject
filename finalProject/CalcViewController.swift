//
//  CalcViewController.swift
//  finalProject
//
//  Created by London Bielicke on 8/8/18.
//  Copyright © 2018 London Bielicke. All rights reserved.
//

import UIKit

class CalcViewController: UIViewController {

    @IBOutlet weak var wantedGrade: UITextField!
    @IBOutlet weak var finalPercent: UITextField!
    @IBOutlet weak var currentPercent: UITextField!
    @IBOutlet weak var whatYouNeed: UILabel!
    
    func finalGrade(currentGrade: Double, finalWorth: Double, goalGrade: Double) -> Double {
        
        var finalGrade : Double
        
        if finalWorth > 0.0 && finalWorth < 100.0 && currentGrade > 0.0 && currentGrade < 100.0 {
            finalGrade = ((currentGrade * (1 - (finalWorth/100))) - goalGrade) / -(finalWorth/100)
            return finalGrade
        }
            
        else {
            return 0.0
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func calculateStuff(_ sender: Any) {
        whatYouNeed.text = String(finalGrade(currentGrade: NSString(string: currentPercent.text!).doubleValue, finalWorth: NSString(string: finalPercent.text!).doubleValue, goalGrade: NSString(string: wantedGrade.text!).doubleValue))
        
        
        
        
        
        
        
    }
    
    

}
