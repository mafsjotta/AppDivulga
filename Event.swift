//
//  Event.swift
//  Divulga
//
//  Created by Mafalda Garcia on 21/05/16.
//  Copyright © 2016 LID. All rights reserved.
//

import UIKit
import CoreData

class Event:NSManagedObject {
    
    
    // MARK: Properties
    
    @NSManaged var name: String
    //var photo: UIImage
    @NSManaged var date: String
    @NSManaged var dateEnd: String
    @NSManaged var insc: String
    @NSManaged var details: String
    @NSManaged var link: String
    @NSManaged var org: String
    @NSManaged var topic: String
    @NSManaged var level: String
    @NSManaged var imagelink: String

    
    // MARK: Initialization
    
    init?(name: String, insc:String, date: String, dateEnd: String, details:String, link: String, org: String, topic:String, level: String, imagelink: String) {
        
        // Initialize stored properties.
        self.name = name
        self.insc = insc
        self.date = date
        self.dateEnd = dateEnd
        self.details = details
        self.link = link
        self.org = org
        self.dateEnd = dateEnd
        self.topic = topic
        self.level = level
        self.imagelink = imagelink
        
        
        
        // Initialization should fail if there is no name
        if name.isEmpty  {
            return nil
        }
    }

}
