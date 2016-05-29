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
        
        // Directório dos documentos da aplicação
        //let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) as NSArray
        //let documentsDir = paths.firstObject as! String
        //print("Path to the Documents directory\n\(documentsDir)")
        
        return true
    }
  
    // MARK: - CSV Parser Methods
    
    func parseCSV (contentsOfURL: NSURL, encoding: NSStringEncoding) -> [(name:String, detail:String, price: String)]? {
        
        // Load the CSV file and parse it
        let delimiter = ";"
        var items:[(name:String, detail:String, price: String)]?
        
        do {
            let content = try String(contentsOfURL: contentsOfURL, encoding: encoding)
            print(content)
            items = []
            let lines:[String] = content.componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet()) as [String]
            
            for line in lines {
                var values:[String] = []
                if line != "" {
                    // For a line with double quotes
                    // we use NSScanner to perform the parsing
                    if line.rangeOfString("\"") != nil {
                        var textToScan:String = line
                        var value:NSString?
                        var textScanner:NSScanner = NSScanner(string: textToScan)
                        while textScanner.string != "" {
                            
                            if (textScanner.string as NSString).substringToIndex(1) == "\"" {
                                textScanner.scanLocation += 1
                                textScanner.scanUpToString("\"", intoString: &value)
                                textScanner.scanLocation += 1
                            } else {
                                textScanner.scanUpToString(delimiter, intoString: &value)
                            }
                            
                            // Store the value into the values array
                            values.append(value as! String)
                            
                            // Retrieve the unscanned remainder of the string
                            if textScanner.scanLocation < textScanner.string.characters.count {
                                textToScan = (textScanner.string as NSString).substringFromIndex(textScanner.scanLocation + 1)
                            } else {
                                textToScan = ""
                            }
                            textScanner = NSScanner(string: textToScan)
                        }
                        
                        // For a line without double quotes, we can simply separate the string
                        // by using the delimiter (e.g. comma)
                    } else  {
                        values = line.componentsSeparatedByString(delimiter)
                    }
                    
                    // Put the values into the tuple and add it to the items array
                    let item = (name: values[0], detail: values[1], price: values[2])
                    items?.append(item)
                }
            }
            
        } catch {
            print(error)
        }
        
        return items
    }
    
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

