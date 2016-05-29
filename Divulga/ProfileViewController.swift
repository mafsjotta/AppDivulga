//
//  ThirdViewController.swift
//  Divulga
//
//  Created by Mafalda Garcia on 19/05/16.
//  Copyright © 2016 LID. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profilePicture: UIImageView!
    
    @IBOutlet weak var physButton: CheckBox!
    @IBOutlet weak var matButton: CheckBox!
    @IBOutlet weak var bioButton: CheckBox!
    @IBOutlet weak var geoButton: CheckBox!
    @IBOutlet weak var medButton: CheckBox!
    @IBOutlet weak var astButton: CheckBox!
    @IBOutlet weak var progButton: CheckBox!
    @IBOutlet weak var eleButton: CheckBox!
    
    
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let interests = defaults.objectForKey("userInterests") as? [String: Bool] ?? [String: Bool]()
        
        
        let username  = defaults.objectForKey("userName") as? String ?? String()
        //let password  = defaults.objectForKey("userPass")
        
        profileName.text = username
        
        physButton.isChecked = interests["Phy"]!
        matButton.isChecked = interests["Mat"]!
        bioButton.isChecked = interests["Bio"]!
        geoButton.isChecked = interests["Geo"]!
        medButton.isChecked = interests["Med"]!
        astButton.isChecked = interests["Ast"]!
        progButton.isChecked = interests["Pro"]!
        eleButton.isChecked = interests["Ele"]!
        // Do any additional setup after loading the view.
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBAction func changesButtonTapped(sender: AnyObject) {
        
        var interests = defaults.objectForKey("userInterests") as? [String: Bool] ?? [String: Bool]()
     
        interests["Phy"] = physButton.isChecked
        interests["Mat"] = matButton.isChecked
        interests["Bio"] = bioButton.isChecked
        interests["Geo"] = geoButton.isChecked
        interests["Med"] = physButton.isChecked
        interests["Ast"] = matButton.isChecked
        interests["Pro"] = bioButton.isChecked
        interests["Ele"] = geoButton.isChecked
        
        displayMyMessage("Changes Saved", userTitle: " ")
        
    }

    @IBAction func editButtonTapped(sender: AnyObject) {
        profileName.text = "af"
    }
    
    
    @IBAction func logOuButtonTapped(sender: AnyObject) {
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: "isUserLoggedIn");
        NSUserDefaults.standardUserDefaults().synchronize();
        self.performSegueWithIdentifier("logOutView", sender: self)
    }
    
    
    func displayMyMessage(userMessage:String, userTitle:String){
        var myAlert = UIAlertController(title: userTitle, message: userMessage,preferredStyle: UIAlertControllerStyle.Alert)
        
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
