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
        
        //Look in NSUserDefaults and determine if there are previously
        //saved class/label mappings.  If so, fill them in to the TFs
        //*******
        let theTFs = [AclassTF, BclassTF, CclassTF, DclassTF, EclassTF, FclassTF, GclassTF]
        for(var i = 0; i < self.classIDs.count; i++)
        {
            let tempVal = self.defaults.objectForKey(self.classIDs[i]);
            if(tempVal != nil)
            {
                theTFs[i].text = tempVal as! String
            }
        }
        
        //this makes the keyboard show automatically and
        //puts the cursor in AclassTF
        self.AclassTF.becomeFirstResponder()
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveButtonClicked(sender: AnyObject)
    {
        //write the code here that should happen when they save changes
        //to their label/class mappings
        //*****
        //Update NSUserDefaults to store the current mappings
        //Either store the mappings as an NSArray of Strings
        //or store as 7 individual variables in NSUserDefaults
        
        
        defaults.setObject(AclassTF.text, forKey: "A")
        defaults.setObject(BclassTF.text, forKey: "B")
        defaults.setObject(CclassTF.text, forKey: "C")
        defaults.setObject(DclassTF.text, forKey: "D")
        defaults.setObject(EclassTF.text, forKey: "E")
        defaults.setObject(FclassTF.text, forKey: "F")
        defaults.setObject(GclassTF.text, forKey: "G")
        
        defaults.synchronize()
        
        print("A=\(AclassTF.text), B=\(BclassTF.text), C=\(CclassTF.text), D=\(DclassTF.text), E=\(EclassTF.text), F=\(FclassTF.text), G=\(GclassTF.text)")
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    @IBAction func cancelButtonClick(sender: AnyObject)
    {
        self.dismissViewControllerAnimated(true)
            { () -> Void in
            //put code here that you want to execute once the screen has been dismissed
            let defaults = NSUserDefaults.standardUserDefaults()
            self.AclassTF.text = defaults.objectForKey("A") as? String
            self.BclassTF.text = defaults.objectForKey("B") as? String
            self.CclassTF.text = defaults.objectForKey("C") as? String
            self.DclassTF.text = defaults.objectForKey("D") as? String
            self.EclassTF.text = defaults.objectForKey("E") as? String
            self.FclassTF.text = defaults.objectForKey("F") as? String
            self.GclassTF.text = defaults.objectForKey("G") as? String
                
                
        }
    }


    func loadDefaults()
    {
        let defaults = NSUserDefaults.standardUserDefaults()
        AclassTF.text = defaults.objectForKey("A") as? String
        BclassTF.text = defaults.objectForKey("B") as? String
        CclassTF.text = defaults.objectForKey("C") as? String
        DclassTF.text = defaults.objectForKey("D") as? String
        EclassTF.text = defaults.objectForKey("E") as? String
        FclassTF.text = defaults.objectForKey("F") as? String
        GclassTF.text = defaults.objectForKey("G") as? String
    }




    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
