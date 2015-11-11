//
//  ConfigVC.swift
//  BlockSchedule
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
        let defaults = `NSUserDefaults`.standardUserDefaults()
        
        defaults.setObject(AclassTF.text, forKey: "A")
        defaults.setObject(BclassTF.text, forKey: "B")
        defaults.setObject(CclassTF.text, forKey: "C")
        defaults.setObject(DclassTF.text, forKey: "D")
        defaults.setObject(EclassTF.text, forKey: "E")
        defaults.setObject(FclassTF.text, forKey: "F")
        defaults.setObject(GclassTF.text, forKey: "G")
        
        defaults.synchronize()
        
        print("A=\(AclassTF.text), B=\(BclassTF.text), C=\(CclassTF.text), D=\(DclassTF.text), E=\(EclassTF.text), F=\(FclassTF.text), G=\(GclassTF.text)")
    }
    
    @IBAction func cancelButtonClick(sender: AnyObject)
    {
        self.dismissViewControllerAnimated(true) { () -> Void in
            //put code here that you want to execute once the screen has been dismissed
            let defaults = `NSUserDefaults`.standardUserDefaults()
            self.AclassTF.text = defaults.objectForKey("A") as? String
            self.BclassTF.text = defaults.objectForKey("B") as? String
            self.CclassTF.text = defaults.objectForKey("C") as? String
            self.DclassTF.text = defaults.objectForKey("D") as? String
            self.EclassTF.text = defaults.objectForKey("E") as? String
            self.FclassTF.text = defaults.objectForKey("F") as? String
            self.GclassTF.text = defaults.objectForKey("G") as? String
            
            if(self.AclassTF.text == ""){
                loadDefaults()
                cancelButtonClick(<#T##sender: AnyObject##AnyObject#>).setTitle("Cancel", forState: .Normal)
            }
            else {
                self.AclassTF.text = ""
                self.BclassTF.text = ""
                cancelButtonClick(<#T##sender: AnyObject##AnyObject#>).setTitle("Load", forState: .Normal)
            }
        }
            
        }
    }
    
    func loadDefaults() {
        let defaults = `NSUserDefaults`.standardUserDefaults()
        AclassTF.text = defaults.objectForKey("A") as? String
        BclassTF.text = defaults.objectForKey("B") as? String
        CclassTF.text = defaults.objectForKey("C") as? String
        DclassTF.text = defaults.objectForKey("D") as? String
        EclassTF.text = defaults.objectForKey("E") as? String
        FclassTF.text = defaults.objectForKey("F") as? String
        GclassTF.text = defaults.objectForKey("G") as? String
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
