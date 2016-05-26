//
//  RegisterPageViewController.swift
//  Divulga
//
//  Created by Mafalda Garcia on 22/05/16.
//  Copyright © 2016 LID. All rights reserved.
//

import UIKit

class RegisterPageViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var userPassTextField: UITextField!
    @IBOutlet weak var repeatPassTextField: UITextField!

    
    //Interests
    @IBOutlet weak var physicsInterest: CheckBox!
    @IBOutlet weak var mathInterest: CheckBox!
    @IBOutlet weak var bioInterest: CheckBox!
    @IBOutlet weak var geoInterest: CheckBox!
    @IBOutlet weak var medicineInterest: CheckBox!
    @IBOutlet weak var astroInterest: CheckBox!
    @IBOutlet weak var progInterest: CheckBox!
    @IBOutlet weak var electroInterest: CheckBox!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?){
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
    
    @IBAction func registerButtonTapped(sender: AnyObject) {
        let userName = userNameTextField.text;
        let userPass = userPassTextField.text;
        let rePass   = repeatPassTextField.text;
        
        var userInterests: [String: Bool]=["Phy": physicsInterest.isChecked,
                                           "Mat": mathInterest.isChecked,
                                           "Bio": bioInterest.isChecked,
                                           "Geo": geoInterest.isChecked,
                                           "Med": medicineInterest.isChecked,
                                           "Ast": astroInterest.isChecked,
                                           "Pro": progInterest.isChecked,
                                           "Ele": electroInterest.isChecked]

        
        if (userName!.isEmpty || userPass!.isEmpty || rePass!.isEmpty) {
            displayMyAlertMessage("All fields are required");
        }
        
        if userPass?.characters.count<6{
            displayMyAlertMessage("Passwords must have at least 6 characters");
        }
        if userPass != rePass {
            displayMyAlertMessage("Passwords do not match");
        }
        
        NSUserDefaults.standardUserDefaults().setObject(userInterests, forKey: "userInterests")
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
