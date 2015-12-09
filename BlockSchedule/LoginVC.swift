//
//  LoginVC.swift
//  BlockSchedule
//
//  Created by Michael Litman on 11/18/15.
//  Copyright © 2015 Michael Litman. All rights reserved.
//

import UIKit
import Parse

class LoginVC: UIViewController
{

    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var errorTF: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.usernameTF.becomeFirstResponder()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func loginButtonPressed(sender: AnyObject)
    {
        if(self.usernameTF.text?.characters.count == 0)
        {
            self.errorTF.text = "You must enter a username"
        }
        else if(self.passwordTF.text?.characters.count == 0)
        {
            self.errorTF.text = "You must enter a password"
        }
        else
        {
            PFUser.logInWithUsernameInBackground(self.usernameTF.text!, password: self.passwordTF.text!, block: { (user: PFUser?, error: NSError?) -> Void in
                if(user != nil)
                {
                    //user was successfully logged in
                    BlockScheduleCore.currentUser = user
                    let query = PFQuery(className:"BlockClassMap")
                    query.whereKey("owner_id", equalTo:user!)
                    
                    query.findObjectsInBackgroundWithBlock({ (objects: [PFObject]?, error: NSError?) -> Void in
                        if(objects != nil)
                        {
                            BlockScheduleCore.blockClassMapping = objects!
                            let vc = self.storyboard?.instantiateViewControllerWithIdentifier("SelectDayMainScreen") as! ViewController
                            self.presentViewController(vc, animated: true, completion: nil)
                        }
                    })
                    
                    
                }
                else
                {
                    self.errorTF.text = "Bad username/password"
                }
            })
        }

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
