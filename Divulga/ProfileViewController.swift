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

        
        if let imageData = NSUserDefaults.standardUserDefaults().objectForKey("userPicture"),
            let profPic = UIImage(data: imageData as! NSData){
            profilePicture.image = profPic
        }
        let interests = defaults.objectForKey("userInterests") as? [String: Bool] ?? [String: Bool]()
        let username  = defaults.objectForKey("userName") as? String ?? String()
        //let password  = defaults.objectForKey("userPass")
        let userLevel = defaults.integerForKey("userLevel")
        
        
        profileName.text = username
        
        physButton.isChecked = interests["Phy"]!
        matButton.isChecked = interests["Mat"]!
        bioButton.isChecked = interests["Bio"]!
        geoButton.isChecked = interests["Geo"]!
        medButton.isChecked = interests["Med"]!
        astButton.isChecked = interests["Ast"]!
        progButton.isChecked = interests["Pro"]!
        eleButton.isChecked = interests["Ele"]!
        

        switch userLevel
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
        
        levelButton.selectedSegmentIndex = userLevel
        // Do any additional setup after loading the view.
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBAction func changesButtonTapped(sender: AnyObject) {
        NSLog("pikxa")
        var interests = defaults.objectForKey("userInterests") as? [String: Bool] ?? [String: Bool]()
     
        interests["Phy"] = physButton.isChecked
        interests["Mat"] = matButton.isChecked
        interests["Bio"] = bioButton.isChecked
        interests["Geo"] = geoButton.isChecked
        interests["Med"] = medButton.isChecked
        interests["Ast"] = astButton.isChecked
        interests["Pro"] = progButton.isChecked
        interests["Ele"] = eleButton.isChecked
        
        
        
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
