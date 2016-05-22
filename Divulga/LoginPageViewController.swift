//
//  LoginPageViewController.swift
//  Divulga
//
//  Created by Mafalda Garcia on 22/05/16.
//  Copyright © 2016 LID. All rights reserved.
//

import UIKit

class LoginPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var userNameTextField: UITextField!

    @IBOutlet weak var userPassTextField: UITextField!
    
    @IBAction func loginButtonTapped(sender: AnyObject) {
        
        
        let userName = userNameTextField.text;
        let userPass = userPassTextField.text;
        
        let userNameStored = NSUserDefaults.standardUserDefaults().stringForKey("userName");
        let userPassStored = NSUserDefaults.standardUserDefaults().stringForKey("userPass");
        
        //self.dismissViewControllerAnimated(true,completion:nil);
        
        if(userNameStored == userName){
            if(userPassStored == userPass){
                //login successfull
                NSUserDefaults.standardUserDefaults().setBool(true, forKey:"isUserLoggedIn");
                NSUserDefaults.standardUserDefaults().synchronize();
                
                self.dismissViewControllerAnimated(true,completion:nil);
            }
        }

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
