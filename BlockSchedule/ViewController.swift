//
//  ViewController.swift
//  BlockSchedule
//
//  Created by Michael Litman on 10/28/15.
//  Copyright © 2015 Michael Litman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var day1Button: UIButton!
    @IBOutlet weak var day2Button: UIButton!
    @IBOutlet weak var day3Button: UIButton!
    @IBOutlet weak var day4Button: UIButton!
    @IBOutlet weak var day5Button: UIButton!
    @IBOutlet weak var day6Button: UIButton!
    @IBOutlet weak var day7Button: UIButton!

    @IBAction func dayButtonClicked(sender: UIButton)
    {
        //determine which of our buttons above was clicked
        let theButtons = [day1Button, day2Button, day3Button, day4Button, day5Button, day6Button, day7Button]
        
        for(var i = 0; i < theButtons.count; i++)
        {
            if(sender == theButtons[i])
            {
                //button at position i was clicked
                //load the next screen for the appropriate day
                let scheduleVC = self.storyboard?.instantiateViewControllerWithIdentifier("ScheduleVC") as! ScheduleVC
                //injecting data into the destination VC
                //scheduleVC.dayString = "Day \(i+1) was clicked!"
                
                //use the singleton
                BlockScheduleCore.currDay = "Day \(i+1) was clicked!"
                
                self.showViewController(scheduleVC, sender: nil)
                
            }
        }
    }

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

// test comment
