//
//  LoginVC.swift
//  BlockSchedule
//
//  Created by Michael Litman on 11/18/15.
//  Copyright © 2015 Michael Litman. All rights reserved.
//

import UIKit

class LoginVC: UIViewController
{

    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.usernameTF.becomeFirstResponder()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func loginButtonPressed(sender: AnyObject)
    {
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