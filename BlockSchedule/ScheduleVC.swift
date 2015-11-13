//
//  ScheduleVC.swift
//  BlockSchedule
//
//  Created by Michael Litman on 10/28/15.
//  Copyright © 2015 Michael Litman. All rights reserved.
//

import UIKit

class ScheduleVC: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    let defaults = NSUserDefaults.standardUserDefaults()
    let classIDs = ["A","B","C","D","E","F","G"];
    var theMappings = [String]()
    
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
        
        for(var i = 0; i < self.classIDs.count; i++)
        {
            let tempVal = self.defaults.objectForKey(self.classIDs[i]);
            if(tempVal != nil)
            {
                theMappings.append(tempVal as! String)
            }
            else
            {
                theMappings.append(self.classIDs[i]);
            }
        }

        // Do any additional setup after loading the view.
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // #warning Incomplete implementation, return the number of rows
        return BlockScheduleCore.theBlockSchedule[BlockScheduleCore.currDay]!.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
    
        // Configure the cell...
        let val = BlockScheduleCore.theBlockSchedule[BlockScheduleCore.currDay]![indexPath.row] as! String
        if(self.classIDs.contains(val))
        {
            cell.textLabel!.text = self.theMappings[self.classIDs.indexOf(val)!]
        }
        else
        {
            cell.textLabel!.text = val
        }
        return cell
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
