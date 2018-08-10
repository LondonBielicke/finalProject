//
//  TimerViewController.swift
//  finalProject
//
//  Created by London Bielicke on 8/9/18.
//  Copyright © 2018 London Bielicke. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {
    
    @IBOutlet weak var countdownNum: UILabel!
    
    @IBOutlet weak var timePicker: UIDatePicker!
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var stopButton: UIButton!
    
    var x = 2
    
    var timer = Timer()
    
    var intTimer = 0
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func startTime(_ sender: Any) {
        intTimer = Int(timePicker.countDownDuration)
        
        if x%2 == 0 {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCountdown), userInfo: nil, repeats: true)
              x -= 1
        }
    }

      
        
    
    
    @objc func updateCountdown() {
        intTimer -= 1
        
        countdownNum.text! = String(format: "%02d:%02d:%02d", intTimer / 3600, (intTimer % 3600) / 60, (intTimer % 3600) % 60)
        
        print(Double(intTimer))
        print(timePicker.countDownDuration)
        
        if Double(intTimer) == 0.0 {
            staph()
        }
        
    }
    
   
    
    @IBAction func stopTime(_ sender: Any) {
        if x%2 == 1 {
            intTimer = 0
            intTimer = 0
            timer.invalidate()
            countdownNum.text! = "00:00:00"
            x+=1
    }
    }
    func staph() {
        intTimer = 0
        timer.invalidate()
        countdownNum.text! = "00:00:00"
        x += 1
    }
    
    
    
    

    



}
