//
//  ScheduleVC.swift
//  BlockSchedule
//
//  Created by Michael Litman on 10/28/15.
//  Copyright © 2015 Michael Litman. All rights reserved.
//

import UIKit

class ScheduleVC: UIViewController {

    @IBOutlet weak var theLabel: UILabel!
    
    @IBAction func backButtonPressed(sender: AnyObject)
    {
        self.dismissViewControllerAnimated(true) { () -> Void in
            //do something here if you want to execute code as the VC is dismissed
        }
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
        theLabel.text = BlockScheduleCore.currDay
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
