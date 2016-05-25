//
//  RegisterPageViewController.swift
//  Divulga
//
//  Created by Mafalda Garcia on 22/05/16.
//  Copyright © 2016 LID. All rights reserved.
//

import UIKit

class RegisterPageViewController: UIViewController {

    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var userPassTextField: UITextField!
    @IBOutlet weak var repeatPassTextField: UITextField!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registerButtonTapped(sender: AnyObject) {
        let userName = userNameTextField.text;
        let userPass = userPassTextField.text;
        let rePass   = repeatPassTextField.text;
        
        if (userName!.isEmpty || userPass!.isEmpty || rePass!.isEmpty) {
            displayMyAlertMessage("All fields are required");
        }
        
        if userPass != rePass {
            displayMyAlertMessage("Passwords do not match");
            
        }
        NSUserDefaults.standardUserDefaults().setObject(userName, forKey: "userName")
        NSUserDefaults.standardUserDefaults().setObject(userPass, forKey: "userPass")
        NSUserDefaults.standardUserDefaults().synchronize();
        
        var myAlert = UIAlertController(title:"Congrats!!!", message: "You are now registred",preferredStyle: UIAlertControllerStyle.Alert);
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default){action in
            self.dismissViewControllerAnimated(true, completion: nil);
        }
        
        myAlert.addAction(okAction);
        self.presentViewController(myAlert, animated: true, completion: nil);
    }
    
    @IBAction func mindChangedButtonTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil);
    }



    func displayMyAlertMessage(userMessage:String){
        var myAlert = UIAlertController(title:"Alert", message: userMessage,preferredStyle: UIAlertControllerStyle.Alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        
        myAlert.addAction(okAction)
        
        self.presentViewController(myAlert, animated:true, completion:nil)
        
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
