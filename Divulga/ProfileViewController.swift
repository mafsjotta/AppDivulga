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
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let interests = defaults.objectForKey("userInterests") as? [String: Bool] ?? [String: Bool]()
        let username  = defaults.objectForKey("userName") as? String ?? String()
        //let password  = defaults.objectForKey("userPass")
        
        profileName.text = username
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    @IBAction func editButtonTapped(sender: AnyObject) {
        profileName.text = "af"
    }
    
    
    @IBAction func logOuButtonTapped(sender: AnyObject) {
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: "isUserLoggedIn");
        NSUserDefaults.standardUserDefaults().synchronize();
        self.performSegueWithIdentifier("logOutView", sender: self)
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
