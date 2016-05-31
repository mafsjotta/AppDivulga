//
//  ThirdViewController.swift
//  Divulga
//
//  Created by Mafalda Garcia on 19/05/16.
//  Copyright © 2016 LID. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    
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
    

    @IBOutlet weak var levelButton: UISegmentedControl!
    @IBOutlet weak var levelLabel: UILabel!
    
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profilePicture.contentMode = .ScaleAspectFill
        profilePicture.layer.cornerRadius = profilePicture.frame.size.width/2;
        profilePicture.clipsToBounds = true;
        profilePicture.layer.borderWidth = 3.0;
        profilePicture.layer.borderColor = UIColor(red:255.0/255.0, green:255.0/255.0, blue:255.0/255.0, alpha: 1.0).CGColor;

        
        let interests = defaults.objectForKey("userInterests") as? [String: Bool] ?? [String: Bool]()
        let username  = defaults.objectForKey("userName") as? String ?? String()
        let password  = defaults.objectForKey("userPass")
        let level = defaults.integerForKey("userLevel")
        let user =  User(userName: username, userPass:password! as! String, userInterests:interests, userLevel:level)
        
        
        if let imageData = NSUserDefaults.standardUserDefaults().objectForKey("userPicture"),
            let profPic = UIImage(data: imageData as! NSData){
            profilePicture.image = profPic
            user.setpicture(profPic)
        }
        
        
        profileName.text = username
        
        physButton.isChecked = interests["Physics"]!
        matButton.isChecked = interests["Mathematics"]!
        bioButton.isChecked = interests["Biology"]!
        geoButton.isChecked = interests["Geology"]!
        medButton.isChecked = interests["Medicine"]!
        astButton.isChecked = interests["Astronomy"]!
        progButton.isChecked = interests["Programming"]!
        eleButton.isChecked = interests["Electronics"]!
        

        switch level
        {
        case 0:
            levelLabel.text = "Children only";
        case 1:
            levelLabel.text = "General audience";
        case 2:
            levelLabel.text = "Highschool students"
        case 3:
            levelLabel.text = "College students"
        case 4:
            levelLabel.text = "Grad students and teachers"
        default:
            break;
        }
        
        levelButton.selectedSegmentIndex = level
        // Do any additional setup after loading the view.
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBAction func changesButtonTapped(sender: AnyObject) {
  
        var interests = defaults.objectForKey("userInterests") as? [String: Bool] ?? [String: Bool]()
     
        interests["Physics"] = physButton.isChecked
        interests["Mathematics"] = matButton.isChecked
        interests["Biology"] = bioButton.isChecked
        interests["Geology"] = geoButton.isChecked
        interests["Medicine"] = medButton.isChecked
        interests["Astronomy"] = astButton.isChecked
        interests["Programming"] = progButton.isChecked
        interests["Electronics"] = eleButton.isChecked
        
        
        NSUserDefaults.standardUserDefaults().setObject(UIImagePNGRepresentation(profilePicture.image!), forKey: "userPicture")
        NSUserDefaults.standardUserDefaults().setObject(interests, forKey: "userInterests");
        NSUserDefaults.standardUserDefaults().setObject(levelButton.selectedSegmentIndex, forKey: "userLevel")
        NSUserDefaults.standardUserDefaults().synchronize();

        displayMyMessage("Changes Saved", userTitle: " ")
        
    }

    
    
    @IBAction func logOuButtonTapped(sender: AnyObject) {
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: "isUserLoggedIn");
        NSUserDefaults.standardUserDefaults().synchronize();
        self.performSegueWithIdentifier("logOutView", sender: self)
    }
    
    
    
    @IBAction func levelButton(sender: AnyObject) {
        switch levelButton.selectedSegmentIndex
        {
        case 0:
            levelLabel.text = "Children only";
        case 1:
            levelLabel.text = "General audience";
        case 2:
            levelLabel.text = "Highschool students"
        case 3:
            levelLabel.text = "College students"
        case 4:
            levelLabel.text = "Grad students and teachers"
        default:
            break;
        }
        //userLevel = levelButton.selectedSegmentIndex
    }
    
    
    
    @IBAction func selectProfilePicture(sender: UITapGestureRecognizer) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .PhotoLibrary
        imagePickerController.delegate = self
        presentViewController(imagePickerController, animated: true, completion: nil)
    }

    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        // The info dictionary contains multiple representations of the image, and this uses the original.
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        // Set photoImageView to display the selected image.
        profilePicture.image = selectedImage
        
        // Dismiss the picker.
        dismissViewControllerAnimated(true, completion: nil)
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
