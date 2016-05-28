//
//  Event.swift
//  Divulga
//
//  Created by Mafalda Garcia on 21/05/16.
//  Copyright © 2016 LID. All rights reserved.
//

import UIKit


class Event {
    
    
    // MARK: Properties
    
    var name: String
    var photo: UIImage?
    var date: String
    var dateEnd: String
    var insc: Bool
    var details: String
    var link: String
    var org: String
    var topic: String
    var level: Int
    
    // MARK: Initialization
    
    init?(name: String, insc:Bool, photo: UIImage?, date: String, dateEnd: String, details:String, link: String, org: String, topic:String, level: Int ) {
        
        // Initialize stored properties.
        self.name = name
        self.insc = insc
        self.photo = photo
        self.date = date
        self.dateEnd = dateEnd
        self.details = details
        self.link = link
        self.org = org
        self.dateEnd = dateEnd
        self.topic = topic
        self.level = level

        
        
        // Initialization should fail if there is no name
        if name.isEmpty  {
            return nil
        }
    }
}