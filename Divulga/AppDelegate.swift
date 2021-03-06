//
//  AppDelegate.swift
//  Divulga
//
//  Created by Mafalda Garcia on 19/05/16.
//  Copyright © 2016 LID. All rights reserved.
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        let colour = UIColor(red: 0/255.0, green:186/255.0 , blue: 9/255.0 , alpha: 1.0 )
        UITabBar.appearance().tintColor = colour
        UISearchBar.appearance().barTintColor = UIColor.whiteColor()
        UISearchBar.appearance().tintColor = colour
        UITextField.appearanceWhenContainedInInstancesOfClasses([UISearchBar.self]).tintColor = colour

        return true
    }
    
    // MARK: - FMDB
    
     /*
    func openDatabase()-> Bool{
        
        //let resourcePath = NSBundle.mainBundle().resourceURL!.absoluteString
        //let dbPath = resourcePath.stringByAppendingString("evento.db")
       
         let documentFolderPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) as NSArray
         let documentsDir = documentFolderPath.firstObject as! String
         let dbPath = documentsDir.stringByAppendingString("evento.db")
         
         let database = FMDatabase(path: dbPath)
         
         /* Open database read-only. */
         if (!database.openWithFlags(1)) {
         print("Could not open database at \(dbPath).")
         } else {
         self.database = database;
         }
         
 
        let DATABASE_RESOURCE_NAME = "evento"
        let DATABASE_RESOURCE_TYPE = "db"
        
        let documentFolderPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        
        let dbPath = documentFolderPath.stringByAppendingString("evento.db")
        NSLog("\(dbPath)")
        let filemanager = NSFileManager.defaultManager()
        if (!filemanager.fileExistsAtPath(dbPath as String) ) {
            
            let backupDbPath = NSBundle.mainBundle().pathForResource(DATABASE_RESOURCE_NAME, ofType: DATABASE_RESOURCE_TYPE)
            
            if (backupDbPath == nil) {
                return false
            } else {
                do{
                    try filemanager.copyItemAtPath(backupDbPath!, toPath: dbPath as String)
                }catch let error as NSError{
                    print("Fail")
                }
            }
        }
        return true
    }
    */
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
}


