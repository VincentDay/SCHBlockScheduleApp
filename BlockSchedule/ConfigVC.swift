//
//  ConfigVC.swift
//  BlockSchedule
//
//  Created by Michael Litman on 10/28/15.
//  Copyright © 2015 Michael Litman. All rights reserved.
//

import UIKit

class ConfigVC: UIViewController {

    @IBOutlet weak var AclassTF: UITextField!
    @IBOutlet weak var BclassTF: UITextField!
    @IBOutlet weak var CclassTF: UITextField!
    @IBOutlet weak var DclassTF: UITextField!
    @IBOutlet weak var EclassTF: UITextField!
    @IBOutlet weak var FclassTF: UITextField!
    @IBOutlet weak var GclassTF: UITextField!
    
    @IBAction func saveButtonClicked(sender: AnyObject)
    {
        //write the code here that should happen when they save changes
        //to their label/class mappings
        //*****
        //Update NSUserDefaults to store the current mappings
        //Either store the mappings as an NSArray of Strings
        //or store as 7 individual variables in NSUserDefaults
    }
    
    @IBAction func cancelButtonClick(sender: AnyObject)
    {
        self.dismissViewControllerAnimated(true) { () -> Void in
            //put code here that you want to execute once the screen has been dismissed
        }
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //Look in NSUserDefaults and determine if there are previously
        //saved class/label mappings.  If so, fill them in to the TFs
        //*******
        
        
        //this makes the keyboard show automatically and
        //puts the cursor in AclassTF
        self.AclassTF.becomeFirstResponder()
        
        
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
