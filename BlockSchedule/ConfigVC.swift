//
//  ConfigVC.swift
//  BlockSchedule
//


import UIKit

class ConfigVC: UIViewController
{
    let defaults = NSUserDefaults.standardUserDefaults()
    let classIDs = ["A","B","C","D","E","F","G"];
    
    @IBOutlet weak var AclassTF: UITextField!
    @IBOutlet weak var BclassTF: UITextField!
    @IBOutlet weak var CclassTF: UITextField!
    @IBOutlet weak var DclassTF: UITextField!
    @IBOutlet weak var EclassTF: UITextField!
    @IBOutlet weak var FclassTF: UITextField!
    @IBOutlet weak var GclassTF: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let theTFs = [AclassTF, BclassTF, CclassTF, DclassTF, EclassTF, FclassTF, GclassTF]
        for(var i = 0; i < self.classIDs.count; i++)
        {

            theTFs[i].text = BlockScheduleCore.getPFObjectForClass(self.classIDs[i])?.valueForKey("courseName") as! String
        }
        
        //this makes the keyboard show automatically and
        //puts the cursor in AclassTF
        self.AclassTF.becomeFirstResponder()
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveButtonClicked(sender: AnyObject)
    {
        
        let theTFs = [AclassTF, BclassTF, CclassTF, DclassTF, EclassTF, FclassTF, GclassTF]
        for(var i = 0; i < self.classIDs.count; i++)
        {
            let obj = BlockScheduleCore.getPFObjectForClass(self.classIDs[i])
            obj!.setValue(theTFs[i].text!, forKey: "courseName")
            obj!.saveInBackground()
        }

        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    @IBAction func cancelButtonClick(sender: AnyObject)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
