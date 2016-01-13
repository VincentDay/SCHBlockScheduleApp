//
//  RegisterVC.swift
//  BlockSchedule
//
//  Created by Michael Litman on 11/18/15.
//  Copyright © 2015 Michael Litman. All rights reserved.
//

import UIKit
import Parse

class RegisterVC: UIViewController {

    @IBOutlet weak var errorTF: UILabel!
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var confirmPasswordTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func createButtonPressed(sender: AnyObject)
    {
        if(self.usernameTF.text?.characters.count == 0)
        {
            self.errorTF.text = "You must enter a username"
        }
        else if(self.emailTF.text?.characters.count == 0)
        {
            self.errorTF.text = "You must enter a email"
        }
        else if(self.passwordTF.text?.characters.count == 0)
        {
            self.errorTF.text = "You must enter a password"
        }
        else if(self.confirmPasswordTF.text?.characters.count == 0)
        {
            self.errorTF.text = "You must enter a confirmation password"
        }
        else if(self.passwordTF.text != self.confirmPasswordTF.text)
        {
            self.errorTF.text = "Passwords do not match!"
        }
        else
        {
            //time to create an account
            let user = PFUser()
            user.username = self.usernameTF.text
            user.password = self.passwordTF.text
            user.email = self.emailTF.text
            user.signUpInBackgroundWithBlock({ (success: Bool, error: NSError?) -> Void in
                if(success)
                {
                    //user successfully registered, lets prepoluate the BlockScheduleMap for them
                    let classIDs = ["A","B","C","D","E","F","G"]
                    for id in classIDs
                    {
                        let obj = PFObject(className: "BlockClassMap")
                        obj["owner_id"] = user
                        obj["classID"] = id
                        obj["courseName"] = "Name Class"
                        try! obj.save()
                    }
                    self.dismissViewControllerAnimated(true, completion: nil)
                }
                else
                {
                    self.errorTF.text = error?.description
                }
            })
        }
        
    }
    
    @IBAction func cancelButtonPressed(sender: AnyObject)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
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
