//
//  User.swift
//  Divulga
//
//  Created by José Senart on 30/05/16.
//  Copyright © 2016 LID. All rights reserved.
//

import UIKit

class User: NSObject{

    var name: String
    var password: String
    var profilePicture: UIImage!
    var interests: [String: Bool]
    var level: Int
    var favorites: [Event]
    
    init(userName: String, userPass: String, userInterests: [String:Bool], userLevel: Int) {
        self.name       = userName;
        self.password   = userPass;
        self.interests  = userInterests;
        self.level      = userLevel;
        self.favorites  = [];
        
        NSUserDefaults.standardUserDefaults().setObject(userName, forKey: "userName");
        NSUserDefaults.standardUserDefaults().setObject(userPass, forKey: "userPass");
        NSUserDefaults.standardUserDefaults().setObject(userInterests, forKey: "userInterests");
        NSUserDefaults.standardUserDefaults().setObject(userLevel, forKey: "userLevel");
        NSUserDefaults.standardUserDefaults().synchronize();
        
        
    }
    
    func setname(Name: String){
        self.name = Name;
        NSUserDefaults.standardUserDefaults().setObject(name, forKey: "userName");
        NSUserDefaults.standardUserDefaults().synchronize();
    }
    
    func setinterests(Interests: [String:Bool]){
        self.interests = Interests;
        NSUserDefaults.standardUserDefaults().setObject(interests, forKey: "userInterests");
        NSUserDefaults.standardUserDefaults().synchronize();
    }
    
    func setlevel(Level: Int){
        self.level = Level;
        NSUserDefaults.standardUserDefaults().setObject(level, forKey: "userLevel");
        NSUserDefaults.standardUserDefaults().synchronize();
    }
    
    func setpassword(Pass: String){
        self.password = Pass;
        NSUserDefaults.standardUserDefaults().setObject(password, forKey: "userPass");
        NSUserDefaults.standardUserDefaults().synchronize();
    }
    
    func setpicture(Picture: UIImage!){
        self.profilePicture = Picture;
        NSUserDefaults.standardUserDefaults().setObject(UIImagePNGRepresentation(profilePicture), forKey: "userPicture")
        NSUserDefaults.standardUserDefaults().synchronize();
    }
    
    func setUser(userName: String, userPass: String, userInterests: [String:Bool], userLevel: Int, userPicture: UIImage?){
        setname(userName);
        setpassword(userPass);
        setlevel(userLevel);
        setinterests(userInterests);
    }
    
}
