//
//  ViewController.swift
//  BlockSchedule


//

import UIKit
import Parse

class ViewController: UIViewController
{
    let defaults = NSUserDefaults.standardUserDefaults()
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
                BlockScheduleCore.currDay = "Day \(i+1)"
                
                self.showViewController(scheduleVC, sender: nil)
                
            }
        }
    }

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //Parse Test
        let testObject = PFObject(className: "TestObject")
        testObject["foo"] = "bar"
        testObject["name"] = "mike"
        testObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            print("Object has been saved.")
        }
        
        // Do any additional setup after loading the view, typically from a nib.
        //Block Schedule
        let theBlockSchedule = self.defaults.valueForKey("theBlockSchedule")
        if(theBlockSchedule == nil)
        {
            var theBlockScheduleDict = [String : NSArray]()
            theBlockScheduleDict["Day 1"] = "A,B,Break,C,D,Lunch,E,F,SAS".componentsSeparatedByString(",")
            theBlockScheduleDict["Day 2"] = "G,A,Break,B,C,Lunch,D,E,SAS".componentsSeparatedByString(",")
            theBlockScheduleDict["Day 3"] = "F,G,Break,A,B,Lunch,C,D,SAS".componentsSeparatedByString(",")
            theBlockScheduleDict["Day 4"] = "E,F,Break,G,A,Lunch,B,C,SAS".componentsSeparatedByString(",")
            theBlockScheduleDict["Day 5"] = "D,E,Break,F,G,Lunch,A,B,SAS".componentsSeparatedByString(",")
            theBlockScheduleDict["Day 6"] = "C,D,Break,E,F,Lunch,G,A,SAS".componentsSeparatedByString(",")
            theBlockScheduleDict["Day 7"] = "B,C,Break,D,E,Lunch,F,G,SAS".componentsSeparatedByString(",")
            self.defaults.setValue(theBlockSchedule, forKey: "theBlockSchedule")
            self.defaults.synchronize()
            BlockScheduleCore.theBlockSchedule = theBlockScheduleDict
        }
        else
        {
            BlockScheduleCore.theBlockSchedule = theBlockSchedule as! [String: NSArray]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

// test comment
